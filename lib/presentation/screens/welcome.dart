import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:sizer/sizer.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void _pushToKaderAuth() => router.go('/login-kader');
  void _pushToRemajaAuth() => router.go('/login-remaja');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(
                image: const AssetImage('assets/logo/dept-kesehatan-ugm.png'),
                width: 75.w,
                height: 10.h,
                color: const Color(0xFF0D47A1),
              ),
              Image(
                image: const AssetImage('assets/logo/SiMandja-Logo.png'),
                height: 30.h,
                width: 60.w,
              ),
              SizedBox(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      'Pilih Jenis Pengguna: ',
                      style: const GlobalTheme().paragraphStyle.copyWith(
                          fontSize: SizerUtil.deviceType == DeviceType.tablet
                              ? 10.sp
                              : 12.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    SubmitButton(
                      text: 'Peserta Posyandu Remaja',
                      onClick: _pushToRemajaAuth,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    SubmitButton(
                      text: 'Kader',
                      backgroundColor: const GlobalTheme().primaryColor,
                      onClick: _pushToKaderAuth,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  'Aplikasi ini Digunakan Sebagai Pencatatan Data dan Manajemen Informasi Kesehatan yang Dilakukan di Posyandu Remaja',
                  style: const GlobalTheme().paragraphStyle.copyWith(
                        fontSize: SizerUtil.deviceType == DeviceType.tablet
                            ? 6.sp
                            : 8.sp,
                        fontWeight: FontWeight.bold,
                        color: const GlobalTheme().primaryColor,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
