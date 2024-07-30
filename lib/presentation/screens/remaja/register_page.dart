import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/domain/services/kader_auth_service.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/check_box.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_dropdown.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_snackbar.dart';
import 'package:simanja_app/presentation/widgets/atom/date_of_birth.dart';
import 'package:simanja_app/presentation/widgets/atom/gender_slider.dart';
import 'package:simanja_app/presentation/widgets/atom/nude_button.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';
import 'package:simanja_app/utils/enums.dart';

class RegisterRemajaPage extends StatefulWidget {
  const RegisterRemajaPage({super.key});

  void _pushToLogin() => router.go('/login-remaja');

  @override
  State<RegisterRemajaPage> createState() => _RegisterRemajaPageState();
}

class _RegisterRemajaPageState extends State<RegisterRemajaPage> {
  late GlobalTheme theme;
  late Future<List<Map<String, String>>> listPosyandu;
  late List<String> posyanduNames;

  String? _translateNametoUID(List<Map<String, String>> source, String input) {
    for (var item in source) {
      if (item['posyandu'] == input) {
        return item['uid']!;
      }
    }
    return null;
  }

  //* Callback hell
  String _nik = '';
  void _readNIK(data) => _nik = data;

  String _name = '';
  void _readName(data) => _name = data;

  String _posyanduMember = '';
  void _readPosyanduMember(data) => _posyanduMember = data;

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
    super.initState();
    theme = const GlobalTheme();
    listPosyandu = KaderAuthentication().getPosyanduList();
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
                  FutureBuilder(
                      future: KaderAuthentication().getPosyanduList(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasData) {
                          final futureData = snapshot.data!;
                          posyanduNames = futureData
                              .map((item) => item['posyandu']!)
                              .toList();
                          return CustomDropdown(
                              onChanged: _readPosyanduMember,
                              items: posyanduNames);
                        }
                        return const Text('Error');
                      }),
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
                      onClick: () async {
                        UserRemaja remaja = UserRemaja(
                          uid: 'dummy',
                          nik: _nik,
                          name: _name,
                          posyandu: _translateNametoUID(
                                  await listPosyandu, _posyanduMember) ??
                              'dummy',
                          birthDate: _dateOfBirth,
                          address: _address,
                          email: _email,
                          password: _password,
                          bpjs: _bpjs,
                          sex: _sex,
                        );
                        final response =
                            await RemajaAuthentication().createUser(remaja);
                        if (response) {
                          router.go('/login-remaja');
                          showCustomSnackbar(context, 'Berhasil mendaftar', 0);
                        } else {
                          showCustomSnackbar(context, 'Gagal mendaftar', 2);
                        }
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
