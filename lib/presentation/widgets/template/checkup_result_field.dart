import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/presentation/widgets/atom/result_container_small.dart';
import 'package:simanja_app/utils/default_account.dart';

class CheckupResultField extends StatelessWidget {
  final HealthPropertiesRemaja? item;
  const CheckupResultField({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Lokasi Posyandu: ${kaderAccount.namePosyandu}'),
        Text('Tanggal: ${item!.checkedAt!.toIso8601String().substring(0, 10)}'),
        const Padding(padding: EdgeInsets.only(top: 10)),
        ResultContainerSmall(
            value: '${item!.weight} Kg', label: 'Berat Badan (BB)'),
        ResultContainerSmall(
            value: '${item!.height} cm', label: 'Tinggi Badan (BB)'),
        const Padding(padding: EdgeInsets.only(top: 10)),
        ResultContainerSmall(
            value: '${item!.armCircumference} cm',
            label: 'Lingkar Lengan (LiLa)'),
        ResultContainerSmall(
            value: '${item!.abdominalCircumference} cm',
            label: 'Lingkar Perut (LP)'),
        const Padding(padding: EdgeInsets.only(top: 10)),
        ResultContainerSmall(
            value: '${item!.bloodPressure}', label: 'Tekanan Darah / Tensi'),
        ResultContainerSmall(
            value: '${item!.hemoglobin} g/dL', label: 'Hemoglobin (HB)'),
        const Padding(padding: EdgeInsets.only(top: 10)),
        ResultContainerSmall(
            value: '${item!.cholesterol} mg/dL', label: 'Kolesterol'),
        ResultContainerSmall(
            value: '${item!.bloodSugar} mg/dL', label: 'Gula Darah'),
      ],
    );
  }
}
