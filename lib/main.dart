import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart'; // Import Sizer package
import 'package:supabase_flutter/supabase_flutter.dart';

import 'presentation/router/router.dart';

Future<void> main() async {
  await dotenv.load(fileName: "assets/.env");
  await Supabase.initialize(
    url: 'https://wwdvooszvayxzzkxsokv.supabase.co',
    anonKey: dotenv.env['API_ANON_SUPABASE'].toString(),
    debug: true,
  );
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(routerConfig: router);
      },
    );
  }
}
