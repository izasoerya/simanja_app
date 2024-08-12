import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:simanja_app/utils/enums.dart';
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

class RegisterRemajaPage extends StatefulWidget {
  const RegisterRemajaPage({super.key});

  void _pushToLogin() => router.go('/login-remaja');

  @override
  State<RegisterRemajaPage> createState() => _RegisterRemajaPageState();
}

class _RegisterRemajaPageState extends State<RegisterRemajaPage> {
  GlobalTheme theme = const GlobalTheme();
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

  Map<String, dynamic> inputData = {
    'NIK': null,
    'Nama': null,
    'Posyandu': null,
    'Tanggal Lahir': DateTime.now(),
    'Nomor Telepon': null,
    'Jalan': null,
    'No Jalan': null,
    'RT': null,
    'RW': null,
    'Dukuh': null,
    'Kecamatan': null,
    'Perokok': false,
    'Email': null,
    'Password': null,
    'BPJS': false,
    'Jenis Kelamin': Gender.male,
  };

  @override
  void initState() {
    super.initState();
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
                    'Daftar Remaja',
                    style: theme.headerStyle,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  TextInput(
                      labelText: 'NIK',
                      hintText: 'Masukkan NIK...',
                      type: TextInputType.number,
                      action: TextInputAction.next,
                      value: (d) => inputData['NIK'] = d),
                  TextInput(
                      labelText: 'Nama Lengkap',
                      hintText: 'Masukkan Nama Lengkap...',
                      type: TextInputType.name,
                      action: TextInputAction.next,
                      value: (d) => inputData['Nama'] = d),
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
                              label: 'Asal Posyandu',
                              items: posyanduNames,
                              onChanged: (d) => inputData['Posyandu'] = d);
                        }
                        return const Text('No Data Found!');
                      }),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  DateOfBirthField(
                      value: (d) => inputData['Tanggal Lahir'] = d),
                  TextInput(
                      labelText: 'Nomor Telepon / WA',
                      hintText: '0812142...',
                      type: TextInputType.number,
                      action: TextInputAction.next,
                      value: (d) => inputData['Nomor Telepon'] = d),
                  TextInput(
                      labelText: 'Alamat Jalan',
                      hintText: 'Masukkan Nama Jalan...',
                      type: TextInputType.streetAddress,
                      action: TextInputAction.next,
                      value: (d) => inputData['Jalan'] = d),
                  TextInput(
                      labelText: 'Alamat No Jalan',
                      hintText: 'Masukkan No Jalan...',
                      type: TextInputType.number,
                      action: TextInputAction.next,
                      value: (d) => inputData['No Jalan'] = d),
                  TextInput(
                      labelText: 'No RT',
                      hintText: 'Masukkan RT...',
                      type: TextInputType.number,
                      action: TextInputAction.next,
                      value: (d) => inputData['RT'] = d),
                  TextInput(
                      labelText: 'No RW',
                      hintText: 'Masukkan RW...',
                      type: TextInputType.number,
                      action: TextInputAction.next,
                      value: (d) => inputData['RW'] = d),
                  TextInput(
                      labelText: 'Dukuh / Pedukuhan',
                      hintText: 'Masukkan Nama Dukuh...',
                      type: TextInputType.streetAddress,
                      action: TextInputAction.next,
                      value: (d) => inputData['Dukuh'] = d),
                  TextInput(
                      labelText: 'Kecamatan',
                      hintText: 'Masukkan Nama Kecamatan...',
                      type: TextInputType.streetAddress,
                      action: TextInputAction.next,
                      value: (d) => inputData['Kecamatan'] = d),
                  TextInput(
                      labelText: 'Email',
                      hintText: 'Masukkan Email...',
                      type: TextInputType.emailAddress,
                      action: TextInputAction.next,
                      value: (d) => inputData['Email'] = d),
                  TextInput(
                      labelText: 'Kata Sandi',
                      hintText: 'Masukkan Password...',
                      type: TextInputType.visiblePassword,
                      hideText: true,
                      value: (d) => inputData['Password'] = d),
                  ChecklistBox(
                      text: 'Pernah Merokok ?',
                      value: (d) => inputData['Perokok'] = d),
                  ChecklistBox(
                      text: 'Punya BPJS ?',
                      value: (d) => inputData['BPJS'] = d),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  GenderSelection(value: (d) => inputData['gender'] = d),
                  SubmitButton(
                      text: 'Daftar',
                      onClick: () async {
                        for (var item in inputData.entries) {
                          if (item.value == null) {
                            showCustomSnackbar(
                                context, '${item.key} Tidak Boleh Kosong', 2);
                            return;
                          }
                        }

                        UserRemaja remaja = UserRemaja(
                          uid: '',
                          nik: inputData['NIK'],
                          name: inputData['Nama'],
                          posyandu: _translateNametoUID(
                              await listPosyandu, inputData['Posyandu'])!,
                          birthDate: inputData['Tanggal Lahir'],
                          phoneNumber: inputData['Nomor Telepon'],
                          street: inputData['Jalan'],
                          streetNumber: inputData['No Jalan'],
                          rt: int.parse(inputData['RT']),
                          rw: int.parse(inputData['RW']),
                          village: inputData['Dukuh'],
                          district: inputData['Kecamatan'],
                          smoker: inputData['Perokok'],
                          email: inputData['Email'],
                          password: inputData['Password'],
                          bpjs: inputData['BPJS'],
                          sex: inputData['Jenis Kelamin'],
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
