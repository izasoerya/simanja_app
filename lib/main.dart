import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sizer/sizer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'presentation/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/.env");

  EmailOTP.config(
    appName: 'SiMandja',
    otpType: OTPType.numeric,
    emailTheme: EmailTheme.v1,
  );

  await Supabase.initialize(
    url: 'https://wwdvooszvayxzzkxsokv.supabase.co',
    anonKey: dotenv.env['API_ANON_SUPABASE'].toString(),
    debug: true,
  );
  initializeDateFormatting('id_ID', null).then((_) {
    runApp(const ProviderScope(child: MainApp()));
  });
}

Future<void> _requestPermissions(BuildContext ctx) async {
  var photoStatus = await Permission.photos.status;
  var storageStatus = await Permission.storage.status;

  if (Platform.isAndroid && (await _isAndroid10OrLower())) {
    if (storageStatus.isGranted) {
      print('Access to Photos and Storage already granted.');
    } else {
      if (storageStatus.isDenied || storageStatus.isRestricted) {
        storageStatus = await Permission.storage.request();
        if (storageStatus.isGranted) {
          print('Access to Photos and Storage granted.');
        } else {
          await _showPermissionDialog(ctx);
          storageStatus = await Permission.storage.request();
        }
      } else if (storageStatus.isGranted) {
        print('Access to Photos and Storage granted.');
      }
    }
  } else {
    if (photoStatus.isGranted) {
      print('Access to Photos already granted.');
    } else if (photoStatus.isDenied || photoStatus.isRestricted) {
      photoStatus = await Permission.photos.request();
      if (photoStatus.isGranted) {
        print('Access to Photos granted.');
      } else {
        _showPermissionDialog(ctx);
      }
    }
  }
}

Future<bool> _isAndroid10OrLower() async {
  if (Platform.isAndroid) {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    return androidInfo.version.sdkInt <= 29;
  }
  return false;
}

Future<void> _showPermissionDialog(BuildContext ctx) async {
  showDialog(
    context: ctx,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Akses Foto dan File Dibutuhkan'),
        content: const Text('Tolong izinkan akses foto dan file.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _requestPermissions(context),
        builder: (context, snapshot) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return MaterialApp.router(routerConfig: router);
            },
          );
        });
  }
}
