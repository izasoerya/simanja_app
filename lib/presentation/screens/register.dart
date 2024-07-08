import 'package:flutter/material.dart';
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
                  const TextInput(
                    labelText: 'NIK',
                    hintText: 'Masukkan NIK...',
                  ),
                  const TextInput(
                    labelText: 'Nama Lengkap',
                    hintText: 'Masukkan Nama Lengkap...',
                  ),
                  const TextInput(
                    labelText: 'Alamat',
                    hintText: 'Masukkan Alamat...',
                  ),
                  const TextInput(
                    labelText: 'Email',
                    hintText: 'Masukkan Email...',
                  ),
                  const TextInput(
                    labelText: 'Kata Sandi',
                    hintText: 'Masukkan Alamat...',
                  ),
                  const ChecklistBox(
                    text: 'Punya BPJS ?',
                  ),
                  const SubmitButton(text: 'Daftar'),
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
