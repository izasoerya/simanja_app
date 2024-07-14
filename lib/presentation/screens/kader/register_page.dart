import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/domain/services/kader_auth_service.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/date_of_birth.dart';
import 'package:simanja_app/presentation/widgets/atom/nude_button.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_snackbar.dart';
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
  String _key = '';
  void _readKey(data) => _key = data;

  String _nameAccount = '';
  void _readNameAccount(data) => _nameAccount = data;

  String _namePosyandu = '';
  void _readNamePosyandu(data) => _namePosyandu = data;

  String _email = '';
  void _readEmail(data) => _email = data;

  String _password = '';
  void _readPassword(data) => _password = data;

  DateTime _dateOfBirth = DateTime.now();
  void _readDoB(data) => _dateOfBirth = data;

  String _address = '';
  void _readAddress(data) => _address = data;

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
                    'Daftar Kader',
                    style: theme.headerStyle,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  TextInput(
                      labelText: 'Nama Akun',
                      hintText: 'Masukkan Nama Akun...',
                      value: _readNameAccount),
                  TextInput(
                      labelText: 'Nama Posyandu',
                      hintText: 'Masukkan Nama Posyandu...',
                      value: _readNamePosyandu),
                  TextInput(
                      labelText: 'Kode Kader',
                      hintText: 'Masukkan Kode Kader...',
                      value: _readKey),
                  DateOfBirthField(value: _readDoB),
                  TextInput(
                      labelText: 'Alamat',
                      type: TextInputType.streetAddress,
                      hintText: 'Masukkan Alamat...',
                      value: _readAddress),
                  TextInput(
                      labelText: 'Email',
                      type: TextInputType.emailAddress,
                      hintText: 'Masukkan Email...',
                      value: _readEmail),
                  TextInput(
                      labelText: 'Kata Sandi',
                      hintText: 'Masukkan Kata Sandi...',
                      type: TextInputType.visiblePassword,
                      value: _readPassword),
                  SubmitButton(
                      text: 'Daftar',
                      onClick: () {
                        UserKader kader = UserKader(
                            uid: '',
                            nameAccount: _nameAccount,
                            namePosyandu: _namePosyandu,
                            keyPosyandu: _key,
                            birthDate: _dateOfBirth,
                            address: _address,
                            email: _email,
                            password: _password);

                        // TODO: Implement input condition
                        KaderAuthentication().createUser(kader);
                        showCustomSnackbar(context, 'Berhasil mendaftar', 0);
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
