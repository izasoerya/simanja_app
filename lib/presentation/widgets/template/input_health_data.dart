import 'package:flutter/material.dart';
import 'package:simanja_app/utils/enums.dart';
import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/domain/services/remaja_heath_service.dart';
import 'package:simanja_app/presentation/widgets/atom/check_box.dart';
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
          Padding(padding: EdgeInsets.only(top: screenHeight * 0.05)),
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
                value: (d) => inputData.weight = double.parse(d)),
            TextInput(
                hintText: 'Ketik tinggi badan...',
                labelText: 'Tinggi Badan (TB)',
                type: TextInputType.number,
                action: TextInputAction.next,
                value: (d) => inputData.height = double.parse(d)),
            const Padding(padding: EdgeInsets.only(top: 15)),
            _SubmitData(data: inputData, onClick: onReset),
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
                value: (d) => inputData.armCircumference = double.parse(d)),
            ChecklistBox(
                text: 'Resiko KEK\n*Centang apabila LiLa < 23.5 cm',
                value: (d) => inputData.kek = d),
            const Padding(padding: EdgeInsets.only(top: 10)),
            TextInput(
                hintText: 'Ketik lingkar perut...',
                labelText: 'Lingkar Perut (LP)',
                type: TextInputType.number,
                action: TextInputAction.next,
                value: (d) =>
                    inputData.abdominalCircumference = double.parse(d)),
            const Padding(padding: EdgeInsets.only(top: 15)),
            _SubmitData(data: inputData, onClick: onReset),
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
                value: (d) => inputData.tds = double.parse(d)),
            TextInput(
                hintText: 'Ketik tekanan darah diastolik...',
                labelText: 'Tekanan Darah Sistolik (TDD)',
                type: TextInputType.number,
                action: TextInputAction.next,
                value: (d) => inputData.tdd = double.parse(d)),
            TextInput(
                hintText: 'Ketik hemoglobin...',
                labelText: 'Hemoglobin (HB)',
                type: TextInputType.number,
                action: TextInputAction.next,
                value: (d) => inputData.hemoglobin = double.parse(d)),
            ChecklistBox(
                text: 'Resiko Anemia\n*Centang apabila HB < 13 g/dL',
                value: (d) => inputData.anemia = d),
            TextInput(
                hintText: 'Ketik gula darah...',
                labelText: 'Gula Darah',
                type: TextInputType.number,
                action: TextInputAction.next,
                value: (d) => inputData.bloodSugar = double.parse(d)),
            TextInput(
                hintText: 'Ketik kolesterol...',
                labelText: 'Kolesterol',
                type: TextInputType.number,
                action: TextInputAction.next,
                value: (d) => inputData.cholesterol = double.parse(d)),
            const Padding(padding: EdgeInsets.only(top: 15)),
            _SubmitData(data: inputData, onClick: onReset),
          ],
        );
      case HealthInputObject.consultation:
        return Column(
          children: [
            ChecklistBox(text: 'Perokok?', value: (d) => inputData.smoker = d),
            ChecklistBox(
                text: 'Sedang konsumsi TTD?',
                value: (d) => inputData.tablet = d),
            const Padding(padding: EdgeInsets.only(top: 10)),
            TextInput(
                hintText: 'Ketik catatan...',
                labelText: 'Catatan Konseling',
                value: (d) => inputData.note = d),
            const Padding(padding: EdgeInsets.only(top: 15)),
            _SubmitData(data: inputData, onClick: onReset),
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
          final updatedData = data.copyWith(checkedAt: DateTime.now());
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
