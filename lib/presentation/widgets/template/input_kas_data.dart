import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/atom/date_of_birth.dart';
import 'package:simanja_app/presentation/widgets/atom/multiple_selector_box.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';

class InputKasData extends StatefulWidget {
  const InputKasData({super.key});

  @override
  State<InputKasData> createState() => _InputKasDataState();
}

class _InputKasDataState extends State<InputKasData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateOfBirthField(text: 'Tanggal', value: (d) => print(d)),
        // TextInput(
        //     hintText: 'Ketik jumlah kas...',
        //     labelText: 'Jumlah Kas',
        //     value: (d) => print(d)),
        const Padding(padding: EdgeInsets.only(top: 10)),
        MultipleSelectorBox(
            onTap: (_) {}, items: const ['Kas Masuk', 'Kas Keluar']),
        const Padding(padding: EdgeInsets.only(top: 10)),
        TextInput(
            hintText: 'Ketik Jumlah Mutasi...',
            labelText: 'Mutasi',
            value: (d) => print(d)),
        TextInput(
            hintText: 'Ketik Asal Dana...',
            labelText: 'Asal Dana',
            value: (d) => print(d)),
        TextInput(
            hintText: 'Ketik Deskripsi...',
            labelText: 'Deskripsi',
            value: (d) => print(d)),
        const Padding(padding: EdgeInsets.only(top: 30)),
        SubmitButton(text: 'Simpan Rekam Kas', onClick: () {}),
      ],
    );
  }
}
