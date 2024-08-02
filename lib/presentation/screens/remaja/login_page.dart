import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/presentation/provider/provider_user.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/nude_button.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';
import 'package:simanja_app/utils/default_account.dart';

class LoginRemajaPage extends ConsumerStatefulWidget {
  const LoginRemajaPage({super.key});

  void _pushToRegister() => router.go('/register-remaja');
  void _pushToForgotPassword() => router.go('/forgot-password');
  void _pushToDashboard() => router.go('/login-remaja/dashboard-remaja');

  @override
  ConsumerState<LoginRemajaPage> createState() => _LoginRemajaPageState();
}

class _LoginRemajaPageState extends ConsumerState<LoginRemajaPage> {
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
              scale: 0.8,
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
                    'Masuk Remaja',
                    style: GlobalTheme().headerStyle,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  TextInput(
                    hintText: 'Email',
                    labelText: 'Email',
                    value: _readEmail,
                  ),
                  TextInput(
                    hintText: 'Password',
                    labelText: 'Password',
                    value: _readPassword,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  SubmitButton(
                    text: 'Masuk',
                    onClick: () async {
                      UserRemaja user = remajaAccount.copyWith(
                          email: _email, password: _password);
                      await RemajaAuthentication()
                          .loginUser(user)
                          .then((fetchedUser) {
                        if (fetchedUser != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Login Berhasil')));
                          setUserRemaja(ref, fetchedUser);
                          widget._pushToDashboard();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Login Gagal')));
                        }
                      });
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  NudeButton(
                      text: 'Lupa Kata Sandi?',
                      redirect: () => widget._pushToForgotPassword()),
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
