import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/domain/services/kader_auth_service.dart';
import 'package:simanja_app/presentation/provider/provider_user.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_snackbar.dart';
import 'package:simanja_app/presentation/widgets/atom/nude_button.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';
import 'package:simanja_app/utils/default_account.dart';
import 'package:sizer/sizer.dart';

class LoginKaderPage extends ConsumerStatefulWidget {
  const LoginKaderPage({super.key});

  void _pushToForgotPassword() => router.go('/forgot-password');
  void _pushToRegister() => router.go('/register-kader');
  void _pushToDashboard() => router.replace('/login-kader/dashboard-kader');

  @override
  ConsumerState<LoginKaderPage> createState() => _LoginKaderPageState();
}

class _LoginKaderPageState extends ConsumerState<LoginKaderPage> {
  String _email = '';
  void _readEmail(data) => _email = data;

  String _password = '';
  void _readPassword(data) => _password = data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15)),
            Image.asset(
              'assets/logo/Logo Word.png',
              scale: 0.8.sp,
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05)),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  Text(
                    'Masuk Kader',
                    style: const GlobalTheme().headerStyle,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  TextInput(
                    hintText: 'Email',
                    labelText: 'Email',
                    type: TextInputType.emailAddress,
                    action: TextInputAction.next,
                    value: _readEmail,
                  ),
                  TextInput(
                    hintText: 'Password',
                    labelText: 'Password',
                    type: TextInputType.name,
                    hideText: true,
                    value: _readPassword,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  SubmitButton(
                    text: 'Masuk',
                    onClick: () async {
                      UserKader kader = kaderAccount.copyWith(
                        email: _email,
                        password: _password,
                      );
                      await KaderAuthentication()
                          .loginUser(kader)
                          .then((fetchedKader) {
                        if (fetchedKader.uid != 'dummy') {
                          setUserKader(ref, fetchedKader);
                          showCustomSnackbar(context, 'Berhasil masuk', 0);
                          widget._pushToDashboard();
                        } else {
                          showCustomSnackbar(
                              context, 'Email atau password salah', 2);
                        }
                      });
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  NudeButton(
                      text: 'Lupa Kata Sandi?',
                      redirect: widget._pushToForgotPassword),
                  NudeButton(text: 'Daftar', redirect: widget._pushToRegister),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
