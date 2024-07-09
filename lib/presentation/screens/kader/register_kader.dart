import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/nude_button.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';

class RegisterKaderPage extends StatefulWidget {
  const RegisterKaderPage({super.key});

  void _pushToLogin() => router.go('/login-kader');

  @override
  State<RegisterKaderPage> createState() => _RegisterKaderPageState();
}

class _RegisterKaderPageState extends State<RegisterKaderPage> {
  late GlobalTheme theme;

  //* Callback hell
  String _name = '';
  void _readName(data) => _name = data;

  String _email = '';
  void _readEmail(data) => _email = data;

  String _password = '';
  void _readPassword(data) => _password = data;

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
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25)),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
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
                    'Daftar Remaja',
                    style: theme.headerStyle,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  TextInput(
                      labelText: 'Nama Lengkap',
                      hintText: 'Masukkan Nama Lengkap...',
                      value: _readName),
                  TextInput(
                      labelText: 'Email',
                      hintText: 'Masukkan Email...',
                      value: _readEmail),
                  TextInput(
                      labelText: 'Kata Sandi',
                      hintText: 'Masukkan Alamat...',
                      value: _readPassword),
                  SubmitButton(
                      text: 'Daftar',
                      onClick: () {
                        UserKader kader = UserKader(
                          name: _name,
                          email: _email,
                          password: _password,
                        );
                        print(
                            'Registering kader: ${kader.name}, ${kader.email}, ${kader.password}');
                      }),
                  NudeButton(
                    text: 'Sudah punya akun? Masuk',
                    redirect: widget._pushToLogin,
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 75)),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)), // Bottom padding
          ],
        ),
      ),
    );
  }
}
