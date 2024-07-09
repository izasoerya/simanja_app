import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/check_box.dart';
import 'package:simanja_app/presentation/widgets/atom/nude_button.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  void _pushToLogin() => router.go('/login');

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late GlobalTheme theme;

  // Callback hell
  String _nik = '';
  _readNIK(data) {
    setState(() => _nik = data);
  }

  String _name = '';
  _readName(data) {
    setState(() => _name = data);
  }

  String _address = '';
  _readAddress(data) {
    setState(() => _address = data);
  }

  String _email = '';
  _readEmail(data) {
    setState(() => _email = data);
  }

  String _password = '';
  _readPassword(data) {
    setState(() => _password = data);
  }

  bool _bpjs = false;
  _readBPJS(data) {
    setState(() => _bpjs = data);
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
                    labelText: 'NIK',
                    hintText: 'Masukkan NIK...',
                    value: _readNIK,
                  ),
                  TextInput(
                    labelText: 'Nama Lengkap',
                    hintText: 'Masukkan Nama Lengkap...',
                    value: _readName,
                  ),
                  TextInput(
                    labelText: 'Alamat',
                    hintText: 'Masukkan Alamat...',
                    value: _readAddress,
                  ),
                  TextInput(
                    labelText: 'Email',
                    hintText: 'Masukkan Email...',
                    value: _readEmail,
                  ),
                  TextInput(
                    labelText: 'Kata Sandi',
                    hintText: 'Masukkan Alamat...',
                    value: _readPassword,
                  ),
                  ChecklistBox(
                    text: 'Punya BPJS ?',
                    value: _readBPJS,
                  ),
                  SubmitButton(
                      text: 'Daftar',
                      onClick: () {
                        UserRemaja remaja = UserRemaja(
                          nik: _nik,
                          name: _name,
                          address: _address,
                          email: _email,
                          password: _password,
                          bpjs: _bpjs,
                        );
                        // Todo: Implement registration logic
                        print('name: ${remaja.name}, status: ${remaja.bpjs}');
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
