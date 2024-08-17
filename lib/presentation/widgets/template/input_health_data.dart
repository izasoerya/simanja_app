import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_dropdown.dart';
import 'package:simanja_app/utils/date_formatter.dart';
import 'package:simanja_app/utils/enums.dart';
import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/domain/services/remaja_heath_service.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';
import 'package:simanja_app/presentation/widgets/organism/image_box_health_input.dart';

class InputHealthData extends StatefulWidget {
  final String uidCheckup;
  final String uidRemaja;
  const InputHealthData(
      {super.key, required this.uidRemaja, required this.uidCheckup});

  @override
  State<InputHealthData> createState() => _InputHealthDataState();
}

class _InputHealthDataState extends State<InputHealthData> {
  HealthPropertiesRemaja healthData = HealthPropertiesRemaja();
  HealthInputObject selectedObject = HealthInputObject.imt;
  GlobalKey<_InputHealthDataState> _key = GlobalKey();

  void _resetHealthData() => setState(() {
        _key = GlobalKey();
        healthData = HealthPropertiesRemaja();
      });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final data = healthData.copyWith(
      uidRemaja: widget.uidRemaja,
      uidCheckup: widget.uidCheckup,
    );

    return SizedBox(
      key: _key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: screenWidth * 0.9,
            child: ImageBoxHealthInput(
                onTap: (p0) => setState(() => selectedObject = p0),
                defaultValue: selectedObject),
          ),
          Padding(padding: EdgeInsets.only(top: screenHeight * 0.025)),
          _HealthDataInput(
            selectedObject: selectedObject,
            healthData: data,
            onReset: _resetHealthData,
          ),
        ],
      ),
    );
  }
}

class _HealthDataInput extends StatelessWidget {
  final HealthInputObject selectedObject;
  final HealthPropertiesRemaja healthData;
  final VoidCallback onReset;

  const _HealthDataInput({
    required this.selectedObject,
    required this.healthData,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    HealthPropertiesRemaja inputData = healthData;
    switch (selectedObject) {
      case HealthInputObject.imt:
        return Column(
          children: [
            TextInput(
                hintText: 'Ketik berat badan (bb)...',
                labelText: 'Berat Badan (BB)',
                type: TextInputType.number,
                action: TextInputAction.next,
                isNumeric: true,
                value: (d) =>
                    d.isNotEmpty ? inputData.weight = double.parse(d) : null),
            TextInput(
                hintText: 'Ketik tinggi badan...',
                labelText: 'Tinggi Badan (TB)',
                type: TextInputType.number,
                action: TextInputAction.next,
                isNumeric: true,
                value: (d) =>
                    d.isNotEmpty ? inputData.height = double.parse(d) : null),
            const Padding(padding: EdgeInsets.only(top: 15)),
            _SubmitData(data: inputData, onClick: onReset),
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05))
          ],
        );
      case HealthInputObject.kek:
        return Column(
          children: [
            TextInput(
                hintText: 'Ketik lingkar lengan...',
                labelText: 'Lingkar Lengan (LiLa)',
                type: TextInputType.number,
                action: TextInputAction.next,
                isNumeric: true,
                value: (d) => d.isNotEmpty
                    ? inputData.armCircumference = double.parse(d)
                    : null),
            TextInput(
                hintText: 'Ketik lingkar perut...',
                labelText: 'Lingkar Perut (LP)',
                type: TextInputType.number,
                action: TextInputAction.next,
                isNumeric: true,
                value: (d) => d.isNotEmpty
                    ? inputData.abdominalCircumference = double.parse(d)
                    : null),
            const Padding(padding: EdgeInsets.only(top: 15)),
            _SubmitData(data: inputData, onClick: onReset),
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05))
          ],
        );
      case HealthInputObject.bloodCheck:
        return Column(
          children: [
            TextInput(
                hintText: 'Ketik tekanan darah sistolik...',
                labelText: 'Tekanan Darah Sistolik (TDS)',
                type: TextInputType.number,
                action: TextInputAction.next,
                isNumeric: true,
                value: (d) =>
                    d.isNotEmpty ? inputData.tds = double.parse(d) : null),
            TextInput(
                hintText: 'Ketik tekanan darah diastolik...',
                labelText: 'Tekanan Darah Diastolik (TDD)',
                type: TextInputType.number,
                action: TextInputAction.next,
                isNumeric: true,
                value: (d) =>
                    d.isNotEmpty ? inputData.tdd = double.parse(d) : null),
            TextInput(
                hintText: 'Ketik hemoglobin...',
                labelText: 'Hemoglobin (HB)',
                type: TextInputType.number,
                action: TextInputAction.next,
                isNumeric: true,
                value: (d) => d.isNotEmpty
                    ? inputData.hemoglobin = double.parse(d)
                    : null),
            TextInput(
                hintText: 'Ketik kadar glukosa di vena...',
                labelText: 'Kadar Glukosa di Vena',
                type: TextInputType.number,
                action: TextInputAction.next,
                isNumeric: true,
                value: (d) =>
                    d.isNotEmpty ? inputData.vena = double.parse(d) : null),
            TextInput(
                hintText: 'Ketik kadar glukosa di kapiler...',
                labelText: 'Kadar Kapiler di Vena',
                type: TextInputType.number,
                action: TextInputAction.next,
                isNumeric: true,
                value: (d) =>
                    d.isNotEmpty ? inputData.capillar = double.parse(d) : null),
            CustomDropdown(
                label: 'Sedang Puasa?',
                items: const ['Ya', 'Tidak'],
                hint: 'Pilih...',
                onChanged: (d) => d == 'Ya'
                    ? inputData.smoker = true
                    : inputData.smoker = false),
            TextInput(
                hintText: 'Ketik kolesterol...',
                labelText: 'Kolesterol',
                type: TextInputType.number,
                action: TextInputAction.next,
                isNumeric: true,
                value: (d) => d.isNotEmpty
                    ? inputData.cholesterol = double.parse(d)
                    : null),
            const Padding(padding: EdgeInsets.only(top: 15)),
            _SubmitData(data: inputData, onClick: onReset),
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05))
          ],
        );
      case HealthInputObject.consultation:
        return Column(
          children: [
            CustomDropdown(
                label: 'Perokok',
                items: const ['Ya', 'Tidak'],
                hint: 'Pilih...',
                onChanged: (d) => d == 'Ya'
                    ? inputData.smoker = true
                    : inputData.smoker = false),
            const Padding(padding: EdgeInsets.only(top: 10)),
            CustomDropdown(
                label: 'Sedang Konsumsi TTD',
                items: const ['Ya', 'Tidak'],
                hint: 'Pilih...',
                onChanged: (d) => d == 'Ya'
                    ? inputData.tablet = true
                    : inputData.tablet = false),
            const Padding(padding: EdgeInsets.only(top: 10)),
            TextInput(
                hintText: 'Ketik catatan...',
                labelText: 'Catatan Konseling',
                value: (d) => inputData.note = d),
            const Padding(padding: EdgeInsets.only(top: 15)),
            _SubmitData(data: inputData, onClick: onReset),
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05))
          ],
        );
    }
  }
}

class _SubmitData extends StatelessWidget {
  final HealthPropertiesRemaja data;
  final VoidCallback onClick;
  const _SubmitData({required this.data, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SubmitButton(
        text: 'Simpan Perubahan',
        onClick: () async {
          final remaja =
              await RemajaAuthentication().getUserbyUID(data.uidRemaja!);
          if (remaja == null) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Koneksi Bermasalah')));
            return;
          }
          final updatedData = data.copyWith(
              checkedAt: DateTime.now(),
              age: DateFormatter().calculateAgeInMonths(remaja.birthDate));
          final response =
              await RemajaHealthService().upsertRemajaHealth(updatedData);
          if (response != null) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Data Berhasil Disimpan')));
            onClick();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Data Gagal Disimpan')));
          }
        });
  }
}
