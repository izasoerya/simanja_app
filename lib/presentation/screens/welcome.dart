import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void _pushToKaderAuth() => router.go('/login');
  void _pushToRemajaAuth() => router.go('/login');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Selamat \nDatang',
                textAlign: TextAlign.center, // Center text
                style: GlobalTheme()
                    .headerStyle
                    .copyWith(fontSize: 36, fontWeight: FontWeight.w900),
              ),
              const Image(
                image: AssetImage('assets/logo/SiMandja-Logo.png'),
                height: 275,
                width: 275,
              ),
              SizedBox(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      'Pilih Jenis Pengguna: ',
                      style: GlobalTheme().paragraphStyle,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    SubmitButton(
                      text: 'Peserta Posyandu Remaja',
                      onClick: _pushToRemajaAuth,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    SubmitButton(
                      text: 'Kader',
                      backgroundColor: GlobalTheme().primaryColor,
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
