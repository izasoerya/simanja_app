import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/presentation/provider/provider_user.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/horizontal_datepicker.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';

class ScheduleCheckup extends ConsumerStatefulWidget {
  const ScheduleCheckup({super.key});

  @override
  ConsumerState<ScheduleCheckup> createState() => _ScheduleCheckupState();
}

class _ScheduleCheckupState extends ConsumerState<ScheduleCheckup> {
  DateTime _date = DateTime.now();
  _onDateChange(DateTime date) => _date = date;

  String _name = '';
  _onNameChange(String name) => _name = name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontalDatePicker(onDateChange: _onDateChange),
        const Padding(padding: EdgeInsets.only(top: 15)),
        TextInput(
            hintText: 'Nama Acara...',
            labelText: 'Nama Acara',
            value: _onNameChange),
        const Padding(padding: EdgeInsets.only(top: 5)),
        SubmitButton(
            text: 'Jadwalkan Checkup',
            backgroundColor: const GlobalTheme().primaryColor,
            onClick: () async {
              final response = await KaderCheckupService().scheduleCheckup(
                  _name, _date, ref.watch(userKaderProvider).uid);
              if (response != null) {
                print(
                    'Berhasil membuat jadwal ${response.uid} pada ${response.dateEvent} dengan judul ${response.checkupTitle}');
              } else {
                print('Gagal membuat jadwal $_name pada $_date');
              }
            }),
      ],
    );
  }
}
