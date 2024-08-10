import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/domain/services/remaja_heath_service.dart';
import 'package:simanja_app/presentation/widgets/atom/check_box.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';

class InputHealthData extends StatefulWidget {
  final String checkup;
  final String remaja;
  const InputHealthData(
      {super.key, required this.checkup, required this.remaja});

  @override
  State<InputHealthData> createState() => _InputHealthDataState();
}

class _InputHealthDataState extends State<InputHealthData> {
  HealthPropertiesRemaja healthData = HealthPropertiesRemaja();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextInput(
            hintText: 'Ketik berat badan (bb)...',
            labelText: 'Berat Badan (BB)',
            value: (d) => healthData.weight = double.parse(d)),
        TextInput(
            hintText: 'Ketik tinggi badan...',
            labelText: 'Tinggi Badan (TB)',
            value: (d) => healthData.height = double.parse(d)),
        TextInput(
            hintText: 'Ketik lingkar lengan...',
            labelText: 'Lingkar Lengan (LiLa)',
            value: (d) => healthData.armCircumference = double.parse(d)),
        ChecklistBox(
            text: 'Resiko KEK\n*Centang apabila LiLa < 23.5 cm',
            value: (d) => healthData.kek = d),
        const Padding(padding: EdgeInsets.only(top: 10)),
        TextInput(
            hintText: 'Ketik lingkar perut...',
            labelText: 'Lingkar Perut (LP)',
            value: (d) => healthData.abdominalCircumference = double.parse(d)),
        TextInput(
            hintText: 'Ketik tekanan darah sistolik...',
            labelText: 'Tekanan Darah Sistolik (TDS)',
            value: (d) => healthData.tds = double.parse(d)),
        TextInput(
            hintText: 'Ketik tekanan darah diastolik...',
            labelText: 'Tekanan Darah Sistolik (TDD)',
            value: (d) => healthData.tdd = double.parse(d)),
        TextInput(
            hintText: 'Ketik hemoglobin...',
            labelText: 'Hemoglobin (HB)',
            value: (d) => healthData.hemoglobin = double.parse(d)),
        ChecklistBox(
            text: 'Resiko Anemia\n*Centang apabila HB < 13 g/dL',
            value: (d) => healthData.anemia = d),
        ChecklistBox(text: 'Perokok?', value: (d) => healthData.smoker = d),
        ChecklistBox(
            text: 'Sedang konsumsi TTD?', value: (d) => healthData.tablet = d),
        const Padding(padding: EdgeInsets.only(top: 10)),
        TextInput(
            hintText: 'Ketik kolesterol...',
            labelText: 'Kolesterol',
            value: (d) => healthData.cholesterol = double.parse(d)),
        TextInput(
            hintText: 'Ketik gula darah...',
            labelText: 'Gula Darah',
            value: (d) => healthData.bloodSugar = double.parse(d)),
        TextInput(
            hintText: 'Ketik catatan...',
            labelText: 'Catatan Konseling',
            value: (d) => healthData.note = d),
        const Padding(padding: EdgeInsets.only(top: 30)),
        SubmitButton(
            text: 'Simpan Perubahan',
            onClick: () async {
              final remaja =
                  await RemajaAuthentication().getUserbyUID(widget.remaja);
              final updatedHealthData = healthData.copyWith(
                uidCheckup: widget.checkup,
                uidRemaja: remaja!.uid,
                anemia: healthData.anemia,
                kek: healthData.kek,
                smoker: healthData.smoker,
                tablet: healthData.tablet,
                checkedAt: DateTime.now(),
              );
              final response = await RemajaHealthService().upsertRemajaHealth(
                  updatedHealthData,
                  widget.remaja,
                  widget.checkup,
                  DateTime.now());
              if (response != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data Berhasil Disimpan')));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data Gagal Disimpan')));
              }
            }),
        const Padding(padding: EdgeInsets.only(top: 50)),
      ],
    );
  }
}
