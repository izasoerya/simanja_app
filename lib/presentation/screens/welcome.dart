import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage('assets/logo/ugm.png'),
                        height: 5.h,
                        width: 10.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Departemen Layanan dan\nInformasi Kesehatan',
                        style: const GlobalTheme().paragraphStyle.copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: const GlobalTheme().primaryColor),
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 3.h)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      'Aplikasi ini Digunakan Sebagai Sistem Informasi Pencatatan dan Manajemen Data Kesehatan Remaja yang Dilakukan di Posyandu Remaja',
                      style: const GlobalTheme().paragraphStyle.copyWith(
                            fontSize: SizerUtil.deviceType == DeviceType.tablet
                                ? 6.sp
                                : 8.sp,
                            fontWeight: FontWeight.bold,
                            color: GlobalTheme().primaryColor,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
