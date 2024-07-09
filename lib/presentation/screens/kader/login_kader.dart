import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/domain/services/kader_auth.dart';
import 'package:simanja_app/presentation/provider/provider_user.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/nude_button.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';

class LoginKaderPage extends ConsumerStatefulWidget {
  const LoginKaderPage({super.key});

  void _pushToForgotPassword() => router.go('/forgot-password');
  void _pushToRegister() => router.go('/register-kader');
  void _pushToDashboard() => router.push('/dashboard-kader');

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
                    'Masuk Kader',
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
                      var kader = UserKader(email: _email, password: _password);
                      await KaderAuthentication()
                          .loginUser(kader)
                          .then((fetchedKader) {
                        if (UserKader().uid == null) {
                          setUserKader(ref, fetchedKader);
                          widget._pushToDashboard();
                        } else {
                          print('Login failed');
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
