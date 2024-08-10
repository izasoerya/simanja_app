import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/domain/services/kadet_event_service.dart';
import 'package:simanja_app/presentation/provider/provider_user.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_dropdown.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_snackbar.dart';
import 'package:simanja_app/presentation/widgets/atom/file_picker.dart';
import 'package:simanja_app/presentation/widgets/atom/horizontal_datepicker.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';

class ScheduleCheckup extends ConsumerStatefulWidget {
  final void Function() onRefresh;
  const ScheduleCheckup({super.key, required this.onRefresh});

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
            type: TextInputType.name,
            action: TextInputAction.next,
            value: _onNameChange),
        CustomDropdown(
            label: 'Jenis Acara',
            hint: 'Pilih jenis acara...',
            items: const ['Checkup', 'Lainnya'],
            onChanged: _onJenisAcaraChange),
        FilePathPicker(path: (d) => _urlImage = d),
        if (_selectedJenisAcara == 'Lainnya') ...[
          const Padding(padding: EdgeInsets.only(top: 15)),
          TextInput(
              hintText: 'Masukkan deskripsi acara...',
              labelText: 'Deskripsi Acara',
              type: TextInputType.multiline,
              action: TextInputAction.newline,
              value: _onDescriptionChange),
          TextInput(
              hintText: 'Masukkan lokasi...',
              labelText: 'Lokasi Acara',
              type: TextInputType.streetAddress,
              action: TextInputAction.next,
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
              type: TextInputType.name,
              action: TextInputAction.next,
              value: _onThemeChange),
          TextInput(
              hintText: 'Masukkan ringkasan kegiatan...',
              labelText: 'Ringkasan Kegiatan',
              type: TextInputType.multiline,
              action: TextInputAction.newline,
              value: _onNoteChange),
          TextInput(
              hintText: 'Masukkan jumlah kader...',
              labelText: 'Jumlah Kader',
              type: TextInputType.name,
              action: TextInputAction.next,
              value: _onKaderCountChange),
          TextInput(
              hintText: 'Masukkan tamu...',
              labelText: 'Tamu Acara',
              type: TextInputType.name,
              action: TextInputAction.next,
              value: _onAttendantChange),
        ],
        const Padding(padding: EdgeInsets.only(top: 20)),
        SubmitButton(
            text: 'Jadwalkan Checkup',
            backgroundColor: const GlobalTheme().primaryColor,
            onClick: () async {
              if (_name.isEmpty) {
                showCustomSnackbar(
                    context, 'Nama kegiatan tidak boleh kosong', 2);
                return;
              }
              if (_date == DateTime.now()) {
                showCustomSnackbar(context, 'Tanggal tidak boleh kosong', 2);
                return;
              }
              if (_selectedJenisAcara! == 'Checkup') {
                final response = await KaderCheckupService().scheduleCheckup(
                    _name, _date, ref.watch(userKaderProvider).uid);
                if (response != null) {
                  showCustomSnackbar(context, 'Berhasil membuat checkup', 0);
                  widget.onRefresh();
                } else {
                  showCustomSnackbar(context, 'Gagal membuat checkup', 2);
                }
              } else {
                if (_description.isEmpty) {
                  showCustomSnackbar(
                      context, 'Deskripsi tidak boleh kosong', 2);
                  return;
                }
                if (_location.isEmpty) {
                  showCustomSnackbar(context, 'Lokasi tidak boleh kosong', 2);
                  return;
                }
                if (_theme.isEmpty) {
                  showCustomSnackbar(context, 'Tema tidak boleh kosong', 2);
                  return;
                }
                if (_selectedJenisKegiatan == null) {
                  showCustomSnackbar(
                      context, 'Jenis kegiatan tidak boleh kosong', 2);
                  return;
                }
                if (_note.isEmpty) {
                  showCustomSnackbar(
                      context, 'Ringkasan tidak boleh kosong', 2);
                  return;
                }

                EventKader event = EventKader(
                    id: 'dummy',
                    idKader: ref.watch(userKaderProvider).uid,
                    name: _name,
                    description: _description,
                    location: _location,
                    date: _date,
                    theme: _theme,
                    topic: _selectedJenisKegiatan!,
                    note: _note,
                    totalKader: _kaderCount,
                    visitor: _attendant,
                    urlImage: _urlImage);
                final response = await KaderEventService().createEvent(event);
                if (response != null) {
                  showCustomSnackbar(context, 'Berhasil membuat acara', 0);
                  widget.onRefresh();
                } else {
                  showCustomSnackbar(context, 'Gagal membuat acara', 2);
                }
              }
            }),
      ],
    );
  }
}
