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
import 'package:sizer/sizer.dart';

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
    theme = const GlobalTheme();
    super.initState();
  }

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
              width: MediaQuery.sizeOf(context).width * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.05),
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
                      action: TextInputAction.next,
                      value: _readNameAccount),
                  TextInput(
                      labelText: 'Nama Posyandu',
                      hintText: 'Masukkan Nama Posyandu...',
                      action: TextInputAction.next,
                      value: _readNamePosyandu),
                  TextInput(
                      labelText: 'Kode Kader',
                      hintText: 'Masukkan Kode Kader...',
                      action: TextInputAction.next,
                      type: TextInputType.number,
                      value: _readKey),
                  DateOfBirthField(value: _readDoB, text: 'Tanggal Berdiri'),
                  TextInput(
                      labelText: 'Alamat',
                      type: TextInputType.streetAddress,
                      hintText: 'Masukkan Alamat...',
                      action: TextInputAction.next,
                      value: _readAddress),
                  TextInput(
                      labelText: 'Email',
                      type: TextInputType.emailAddress,
                      hintText: 'Masukkan Email...',
                      action: TextInputAction.next,
                      value: _readEmail),
                  TextInput(
                      labelText: 'Kata Sandi',
                      hintText: 'Masukkan Kata Sandi...',
                      type: TextInputType.visiblePassword,
                      action: TextInputAction.next,
                      hideText: true,
                      value: _readPassword),
                  SubmitButton(
                      text: 'Daftar',
                      onClick: () {
                        if (_nameAccount.isEmpty) {
                          showCustomSnackbar(
                              context, 'Nama akun tidak boleh kosong', 2);
                          return;
                        }
                        if (_namePosyandu.isEmpty) {
                          showCustomSnackbar(
                              context, 'Nama posyandu tidak boleh kosong', 2);
                          return;
                        }
                        if (_key.isEmpty) {
                          showCustomSnackbar(
                              context, 'Kode tidak boleh kosong', 2);
                          return;
                        }
                        if (_address.isEmpty) {
                          showCustomSnackbar(
                              context, 'Alamat tidak boleh kosong', 2);
                          return;
                        }
                        if (_dateOfBirth == DateTime.now()) {
                          showCustomSnackbar(
                              context, 'Tanggal lahir tidak boleh kosong', 2);
                          return;
                        }
                        if (_email.isEmpty) {
                          showCustomSnackbar(
                              context, 'Email tidak boleh kosong', 2);
                          return;
                        }
                        if (_password.isEmpty) {
                          showCustomSnackbar(
                              context, 'Kata sandi tidak boleh kosong', 2);
                          return;
                        }

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
                        router.go('/login-kader');
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
