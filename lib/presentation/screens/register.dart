import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/domain/services/remaja.auth.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/check_box.dart';
import 'package:simanja_app/presentation/widgets/atom/date_of_birth.dart';
import 'package:simanja_app/presentation/widgets/atom/gender_slider.dart';
import 'package:simanja_app/presentation/widgets/atom/nude_button.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';
import 'package:simanja_app/utils/enums.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  void _pushToLogin() => router.go('/login');

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late GlobalTheme theme;

  //* Callback hell
  String _nik = '';
  void _readNIK(data) => _nik = data;

  String _name = '';
  void _readName(data) => _name = data;

  DateTime _dateOfBirth = DateTime.now();
  void _readDoB(data) => _dateOfBirth = data;

  String _address = '';
  void _readAddress(data) => _address = data;

  String _email = '';
  void _readEmail(data) => _email = data;

  String _password = '';
  void _readPassword(data) => _password = data;

  bool _bpjs = false;
  void _readBPJS(data) => _bpjs = data;

  Gender _sex = Gender.male;
  void _readSex(data) => _sex = data;

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
                      value: _readNIK),
                  TextInput(
                      labelText: 'Nama Lengkap',
                      hintText: 'Masukkan Nama Lengkap...',
                      value: _readName),
                  DateOfBirthField(value: _readDoB),
                  TextInput(
                      labelText: 'Alamat',
                      hintText: 'Masukkan Alamat...',
                      value: _readAddress),
                  TextInput(
                      labelText: 'Email',
                      hintText: 'Masukkan Email...',
                      value: _readEmail),
                  TextInput(
                      labelText: 'Kata Sandi',
                      hintText: 'Masukkan Alamat...',
                      value: _readPassword),
                  ChecklistBox(text: 'Punya BPJS ?', value: _readBPJS),
                  GenderSelection(value: _readSex),
                  SubmitButton(
                      text: 'Daftar',
                      onClick: () {
                        UserRemaja remaja = UserRemaja(
                          nik: _nik,
                          name: _name,
                          birthDate: _dateOfBirth,
                          address: _address,
                          email: _email,
                          password: _password,
                          bpjs: _bpjs,
                          sex: _sex,
                        );
                        // Todo: Implement registration logic
                        print(
                            'Name user: ${remaja.name}, Status: ${remaja.sex}');
                        RemajaAuthentication().createUser(remaja);
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
