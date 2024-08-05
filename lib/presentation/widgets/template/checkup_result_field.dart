import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/result_container_small.dart';
import 'package:simanja_app/presentation/widgets/organism/imt_description.dart';
import 'package:simanja_app/utils/default_account.dart';

class CheckupResultField extends StatelessWidget {
  final HealthPropertiesRemaja? item;
  const CheckupResultField({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lokasi Posyandu: ${kaderAccount.namePosyandu}',
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
                'Tanggal: ${item!.checkedAt!.toIso8601String().substring(0, 10)}',
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
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
                value: '${item!.bloodPressure}',
                label: 'Tekanan Darah / Tensi'),
            ResultContainerSmall(
                value: '${item!.hemoglobin} g/dL', label: 'Hemoglobin (HB)'),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ResultContainerSmall(
                value: '${item!.cholesterol} mg/dL', label: 'Kolesterol'),
            ResultContainerSmall(
                value: '${item!.bloodSugar} mg/dL', label: 'Gula Darah'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ResultContainerSmall(
              value: (item!.weight! / pow(item!.height!, 2)).toStringAsFixed(2),
              label: 'Indeks Massa Tubuh (IMT)',
              textStyle: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              width: 0.3,
              height: 60,
              color: const GlobalTheme().primaryColorLight,
            ),
            const ImtDescription(),
            ResultContainerSmall(
              value: item!.kek! ? 'Ya' : 'Tidak',
              label: 'Resiko KEK',
              width: 0.3,
              color: const GlobalTheme().primaryColorLight,
            ),
            ResultContainerSmall(
              value: item!.abdominalCircumference! > 20 ? 'Tinggi' : 'Normal',
              label: 'Status LP',
              width: 0.3,
              color: const GlobalTheme().primaryColorLight,
            ),
            ResultContainerSmall(
              value: item!.tdd! > 20 ? 'Tinggi' : 'Normal',
              label: 'Status Tensi',
              width: 0.3,
              color: const GlobalTheme().primaryColorLight,
            ),
            ResultContainerSmall(
              value: item!.hemoglobin! < 50 ? 'Ya' : 'Tidak',
              label: 'Status Anemia',
              width: 0.3,
              color: const GlobalTheme().primaryColorLight,
            ),
            ResultContainerSmall(
              value: item!.cholesterol! > 40 ? 'Tinggi' : 'Normal',
              label: 'Status Kolesterol',
              width: 0.3,
              color: const GlobalTheme().primaryColorLight,
            ),
            ResultContainerSmall(
              value: item!.bloodSugar! > 20 ? 'Tinggi' : 'Normal',
              label: 'Status Gula Darah',
              width: 0.3,
              color: const GlobalTheme().primaryColorLight,
            ),
            item!.smoker != null
                ? (item!.smoker!
                    ? const TextIcon(label: 'Merkokok', value: true)
                    : const TextIcon(label: 'Merkokok', value: false))
                : const SizedBox(),
            item!.smoker != null
                ? (item!.smoker!
                    ? const TextIcon(label: 'Sedang konsumsi TTD', value: true)
                    : const TextIcon(
                        label: 'Sedang konsumsi TTD', value: false))
                : const SizedBox(),
          ],
        )
      ],
    );
  }
}

class TextIcon extends StatelessWidget {
  final String label;
  final bool value;
  final double width;
  const TextIcon(
      {super.key, required this.label, required this.value, this.width = 0.3});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Icon(value ? Icons.check_circle : Icons.cancel,
                color: const GlobalTheme().primaryColor, size: 30),
            Text(label,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
