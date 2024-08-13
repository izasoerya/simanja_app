import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'presentation/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/.env");
  await _requestPermissions();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://wwdvooszvayxzzkxsokv.supabase.co',
    anonKey: dotenv.env['API_ANON_SUPABASE'].toString(),
    debug: true,
  );

  runApp(const ProviderScope(child: MainApp()));
}

Future<void> _requestPermissions() async {
  var status = await Permission.photos.status;

  status = await Permission.photos.status;
  if (status.isGranted) {
    print('Access Photo already granted.');
  } else if (status.isDenied || status.isRestricted) {
    status = await Permission.photos.request();

    if (status.isGranted) {
      print('Access Photo granted.');
    } else if (status.isDenied) {
      await openAppSettings();
      await Permission.photos.request();
    } else if (status.isPermanentlyDenied) {
      print('Access Photo permanently denied.');
      await openAppSettings();
    }
  } else if (status.isPermanentlyDenied) {
    print('Access Photo permanently denied.');
    await openAppSettings();
  }
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
