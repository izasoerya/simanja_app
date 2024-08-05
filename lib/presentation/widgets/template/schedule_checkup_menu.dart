import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/domain/services/kadet_event_service.dart';
import 'package:simanja_app/presentation/provider/provider_user.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_dropdown.dart';
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
  _onNameChange(String data) => _name = data;

  String _description = '';
  _onDescriptionChange(String data) => _description = data;

  String _location = '';
  _onLocationChange(String data) => _location = data;

  String _theme = '';
  _onThemeChange(String data) => _theme = data;

  String _note = '';
  _onNoteChange(String data) => _note = data;

  String _kaderCount = '';
  _onKaderCountChange(String data) => _kaderCount = data;

  String _attendant = '';
  _onAttendantChange(String data) => _attendant = data;

  String _urlImage = '';
  _onUrlImageChange(String data) => _urlImage = data;

  String? _selectedJenisAcara;
  _onJenisAcaraChange(String? data) => setState(() {
        _selectedJenisAcara = data;
      });

  String? _selectedJenisKegiatan;
  _onJenisKegiatanChange(String? data) => _selectedJenisKegiatan = data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontalDatePicker(onDateChange: _onDateChange),
        const Padding(padding: EdgeInsets.only(top: 15)),
        TextInput(
            hintText: 'Masukkan nama acara...',
            labelText: 'Nama Acara',
            value: _onNameChange),
        TextInput(
            hintText: 'Masukkan deskripsi acara...',
            labelText: 'Deskripsi Acara',
            value: _onDescriptionChange),
        CustomDropdown(
            label: 'Jenis Acara',
            hint: 'Pilih jenis acara...',
            items: const ['Checkup', 'Lainnya'],
            onChanged: _onJenisAcaraChange),
        if (_selectedJenisAcara == 'Lainnya') ...[
          const Padding(padding: EdgeInsets.only(top: 15)),
          TextInput(
              hintText: 'Masukkan lokasi...',
              labelText: 'Lokasi Acara',
              value: _onLocationChange),
          CustomDropdown(
              label: 'Jenis Kegiatan',
              hint: 'Pilih jenis kegiatan...',
              items: const [
                'PHKS',
                'Kesehatan Reproduksi Remaja',
                'Kesehatan Jiwa & NAPZA',
                'Gizi',
                'Penyakit Tidak Menular',
                'Aktivitas Fisik',
                'Pencegahan Kekerasan Remaja',
                'Kegiatan Lainnya'
              ],
              onChanged: _onJenisKegiatanChange),
          const Padding(padding: EdgeInsets.only(top: 15)),
          TextInput(
              hintText: 'Masukkan tema...',
              labelText: 'Tema Acara',
              value: _onThemeChange),
          TextInput(
              hintText: 'Masukkan ringkasan kegiatan...',
              labelText: 'Ringkasan Kegiatan',
              value: _onNoteChange),
          TextInput(
              hintText: 'Masukkan jumlah kader...',
              labelText: 'Jumlah Kader',
              value: _onKaderCountChange),
          TextInput(
              hintText: 'Masukkan tamu...',
              labelText: 'Tamu Acara',
              value: _onAttendantChange),
        ],
        const Padding(padding: EdgeInsets.only(top: 20)),
        SubmitButton(
            text: 'Jadwalkan Checkup',
            backgroundColor: const GlobalTheme().primaryColor,
            onClick: () async {
              if (_selectedJenisAcara! == 'Checkup') {
                final response = await KaderCheckupService().scheduleCheckup(
                    _name, _date, ref.watch(userKaderProvider).uid);
                if (response != null) {
                  print(
                      'Berhasil membuat jadwal ${response.uid} pada ${response.dateEvent} dengan judul ${response.checkupTitle}');
                } else {
                  print('Gagal membuat jadwal $_name pada $_date');
                }
              } else {
                EventKader event = EventKader(
                    id: 'dummy',
                    idKader: ref.watch(userKaderProvider).uid,
                    location: _location,
                    date: _date,
                    theme: _theme,
                    topic: _selectedJenisKegiatan!,
                    note: _note,
                    totalKader: _kaderCount,
                    visitor: _attendant,
                    urlImage: _urlImage);
                final response = await KaderEventService().createEvent(event);
                if (response == null) {
                  print('Gagal membuat jadwal $_name pada $_date');
                } else {
                  print('Berhasil membuat jadwal $_name pada $_date');
                }
              }
            }),
      ],
    );
  }
}
