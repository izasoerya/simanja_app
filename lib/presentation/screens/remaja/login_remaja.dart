import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/domain/services/remaja.auth.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/nude_button.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';

class LoginRemajaPage extends StatefulWidget {
  const LoginRemajaPage({super.key});

  void _pushToRegister() => router.go('/register-remaja');
  void _pushToForgotPassword() => router.go('/forgot-password');

  @override
  State<LoginRemajaPage> createState() => _LoginRemajaPageState();
}

class _LoginRemajaPageState extends State<LoginRemajaPage> {
  late GlobalTheme theme;

  String _email = '';
  _readEmail(email) {
    setState(() => _email = email);
  }

  String _password = '';
  _readPassword(password) {
    setState(() => _password = password);
  }

  @override
  void initState() {
    theme = GlobalTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  Text(
                    'Masuk Remaja',
                    style: theme.headerStyle,
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
                      UserRemaja remaja = UserRemaja(
                        email: _email,
                        password: _password,
                      );
                      bool auth =
                          await RemajaAuthentication().loginUser(remaja);
                      if (auth) {
                        router.go('/details');
                      }
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
