import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/atom/check_box.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';

class InputHealthData extends StatefulWidget {
  const InputHealthData({super.key});

  @override
  State<InputHealthData> createState() => _InputHealthDataState();
}

class _InputHealthDataState extends State<InputHealthData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextInput(
            hintText: 'Ketik berat badan (bb)...',
            labelText: 'Berat Badan (BB)',
            value: (d) {}),
        TextInput(
            hintText: 'Ketik tinggi badan...',
            labelText: 'Tinggi Badan (TB)',
            value: (d) {}),
        TextInput(
            hintText: 'Ketik lingkar lengan...',
            labelText: 'Lingkar Lengan (LiLa)',
            value: (d) {}),
        ChecklistBox(
            text: 'Resiko KEK\n*Centang apabila LiLa < 23.5 cm', value: (d) {}),
        const Padding(padding: EdgeInsets.only(top: 10)),
        TextInput(
            hintText: 'Ketik lingkar perut...',
            labelText: 'Lingkar Perut (LP)',
            value: (d) {}),
        TextInput(
            hintText: 'Ketik tekanan darah sistolik...',
            labelText: 'Tekanan Darah Sistolik (TDS)',
            value: (d) {}),
        TextInput(
            hintText: 'Ketik hemoglobin...',
            labelText: 'Hemoglobin (HB)',
            value: (d) {}),
        ChecklistBox(
            text: 'Resiko Anemia\n*Centang apabila HB < 13 g/dL',
            value: (d) {}),
        const Padding(padding: EdgeInsets.only(top: 10)),
        TextInput(
            hintText: 'Ketik kolesterol...',
            labelText: 'Kolesterol',
            value: (d) {}),
        TextInput(
            hintText: 'Ketik gula darah...',
            labelText: 'Gula Darah',
            value: (d) {}),
        TextInput(
            hintText: 'Ketik catatan...',
            labelText: 'Catatan Konseling',
            value: (d) {}),
        Padding(padding: EdgeInsets.only(top: 30)),
        SubmitButton(text: 'Simpan Perubahan', onClick: () {}),
        Padding(padding: EdgeInsets.only(top: 50)),
      ],
    );
  }
}
