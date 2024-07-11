import 'package:flutter/material.dart';
import 'package:simanja_app/utils/enums.dart';
import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/domain/services/kader_auth_service.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/check_box.dart';
import 'package:simanja_app/presentation/widgets/atom/date_of_birth.dart';
import 'package:simanja_app/presentation/widgets/atom/gender_slider.dart';
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
  String _nik = '';
  void _readNIK(data) => _nik = data;

  String _nameKader = '';
  void _readNameKader(data) => _nameKader = data;

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
                    'Daftar Kader',
                    style: theme.headerStyle,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  TextInput(
                      labelText: 'Nama Kader',
                      hintText: 'Masukkan Nama Kader...',
                      value: _readNameKader),
                  TextInput(
                      labelText: 'Nama Posyandu',
                      hintText: 'Masukkan Nama Posyandu...',
                      value: _readNamePosyandu),
                  TextInput(
                      labelText: 'NIK',
                      hintText: 'Masukkan NIK...',
                      value: _readNIK),
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
                        UserKader kader = UserKader(
                            uid: '',
                            nameKader: _nameKader,
                            namePosyandu: _namePosyandu,
                            nik: _nik,
                            sex: _sex,
                            birthDate: _dateOfBirth,
                            address: _address,
                            bpjs: _bpjs,
                            email: _email,
                            password: _password);

                        // TODO: Implement input condition
                        KaderAuthentication().createUser(kader);
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
