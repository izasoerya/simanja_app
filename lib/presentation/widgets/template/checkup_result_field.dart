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
    if (item == null) {
      return const Text('belum ada data',
          style: TextStyle(fontSize: 16, color: Colors.red));
    }

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
                'Tanggal: ${item!.checkedAt?.toIso8601String().substring(0, 10) ?? 'belum ada data'}',
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ResultContainerSmall(
                value: item!.weight != null
                    ? '${item!.weight} Kg'
                    : 'belum ada data',
                label: 'Berat Badan (BB)'),
            ResultContainerSmall(
                value: item!.height != null
                    ? '${item!.height} cm'
                    : 'belum ada data',
                label: 'Tinggi Badan (BB)'),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ResultContainerSmall(
                value: item!.armCircumference != null
                    ? '${item!.armCircumference} cm'
                    : 'belum ada data',
                label: 'Lingkar Lengan (LiLa)'),
            ResultContainerSmall(
                value: item!.abdominalCircumference != null
                    ? '${item!.abdominalCircumference} cm'
                    : 'belum ada data',
                label: 'Lingkar Perut (LP)'),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ResultContainerSmall(
                value: item!.bloodPressure != null
                    ? '${item!.bloodPressure}'
                    : 'belum ada data',
                label: 'Tekanan Darah / Tensi'),
            ResultContainerSmall(
                value: item!.hemoglobin != null
                    ? '${item!.hemoglobin} g/dL'
                    : 'belum ada data',
                label: 'Hemoglobin (HB)'),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ResultContainerSmall(
                value: item!.cholesterol != null
                    ? '${item!.cholesterol} mg/dL'
                    : 'belum ada data',
                label: 'Kolesterol'),
            ResultContainerSmall(
                value: item!.bloodSugar != null
                    ? '${item!.bloodSugar} mg/dL'
                    : 'belum ada data',
                label: 'Gula Darah'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ResultContainerSmall(
              value:
                  (item!.imt == null) ? 'NaN' : (item!.imt!).toStringAsFixed(2),
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
              value: item!.kek != null ? item!.kek! : 'belum ada data',
              label: 'Resiko KEK',
              width: 0.3,
              color: const GlobalTheme().primaryColorLight,
            ),
            ResultContainerSmall(
              value: item!.abdominalCircumference != null
                  ? (item!.abdominalCircumference! > 20 ? 'Tinggi' : 'Normal')
                  : 'belum ada data',
              label: 'Status LP',
              width: 0.3,
              color: const GlobalTheme().primaryColorLight,
            ),
            ResultContainerSmall(
              value: item!.tdd != null
                  ? (item!.tdd! > 20 ? 'Tinggi' : 'Normal')
                  : 'belum ada data',
              label: 'Status Tensi',
              width: 0.3,
              color: const GlobalTheme().primaryColorLight,
            ),
            ResultContainerSmall(
              value: item!.hemoglobin != null
                  ? (item!.hemoglobin! < 50 ? 'Ya' : 'Tidak')
                  : 'belum ada data',
              label: 'Status Anemia',
              width: 0.3,
              color: const GlobalTheme().primaryColorLight,
            ),
            ResultContainerSmall(
              value: item!.cholesterol != null
                  ? (item!.cholesterol! > 40 ? 'Tinggi' : 'Normal')
                  : 'belum ada data',
              label: 'Status Kolesterol',
              width: 0.3,
              color: const GlobalTheme().primaryColorLight,
            ),
            ResultContainerSmall(
              value: item!.bloodSugar ?? 'belum ada data',
              label: 'Status Gula Darah',
              width: 0.3,
              color: const GlobalTheme().primaryColorLight,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              alignment: Alignment.centerLeft,
              child: item!.smoker != null
                  ? (item!.smoker!
                      ? const TextIcon(label: 'Merkokok', value: true)
                      : const TextIcon(label: 'Merkokok', value: false))
                  : const SizedBox(),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              alignment: Alignment.centerLeft,
              child: item!.smoker != null
                  ? (item!.smoker!
                      ? const TextIcon(
                          label: 'Sedang konsumsi TTD', value: true)
                      : const TextIcon(
                          label: 'Sedang konsumsi TTD', value: false))
                  : const SizedBox(),
            ),
          ],
        )
      ],
    );
  }
}

class TextIcon extends StatelessWidget {
  final String label;
  final bool value;
  const TextIcon({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Icon(value ? Icons.check_circle : Icons.cancel,
              color: value ? Colors.green : Colors.red, size: 30),
          Text('${value ? '' : 'Tidak'} $label',
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ],
      ),
    );
  }
}
