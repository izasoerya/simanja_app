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
              Text(
                'Selamat \nDatang',
                textAlign: TextAlign.center, // Center text
                style: const GlobalTheme()
                    .headerStyle
                    .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w900),
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
