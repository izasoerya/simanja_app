import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/domain/services/kadet_event_service.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_dropdown.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_snackbar.dart';
import 'package:simanja_app/presentation/widgets/atom/file_picker.dart';
import 'package:simanja_app/presentation/widgets/atom/horizontal_datepicker.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';

class EditScheduleEvent extends ConsumerStatefulWidget {
  final EventKader event;
  const EditScheduleEvent({super.key, required this.event});

  @override
  ConsumerState<EditScheduleEvent> createState() => _ScheduleCheckupState();
}

class _ScheduleCheckupState extends ConsumerState<EditScheduleEvent> {
  DateTime? _date;
  _onDateChange(DateTime date) => _date = date;

  String? _name;
  _onNameChange(String? data) => _name = data;

  String? _description;
  _onDescriptionChange(String? data) => _description = data;

  String? _location;
  _onLocationChange(String? data) => _location = data;

  String? _theme;
  _onThemeChange(String? data) => _theme = data;

  String? _note;
  _onNoteChange(String? data) => _note = data;

  String? _kaderCount;
  _onKaderCountChange(String? data) => _kaderCount = data;

  String? _attendant;
  _onAttendantChange(String? data) => _attendant = data;

  String? _urlImage;
  _onUrlImageChange(String? data) => _urlImage = data;

  String? _selectedJenisKegiatan;
  _onJenisKegiatanChange(String? data) => _selectedJenisKegiatan = data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontalDatePicker(
            onDateChange: _onDateChange, startDate: widget.event.date),
        const Padding(padding: EdgeInsets.only(top: 15)),
        TextInput(
            hintText: 'Masukkan nama acara...',
            labelText: 'Nama Acara',
            value: _onNameChange),
        TextInput(
            hintText: 'Masukkan deskripsi acara...',
            labelText: 'Deskripsi Acara',
            value: _onDescriptionChange),
        FilePathPicker(path: _onUrlImageChange),
        ...[
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
            text: 'Simpan Perubahan',
            backgroundColor: const GlobalTheme().primaryColor,
            onClick: () async {
              EventKader event = widget.event.copyWith(
                  name: _name ?? widget.event.name,
                  description: _description ?? widget.event.description,
                  location: _location ?? widget.event.location,
                  date: _date ?? widget.event.date,
                  theme: _theme ?? widget.event.theme,
                  topic: _selectedJenisKegiatan ?? widget.event.topic,
                  note: _note ?? widget.event.note,
                  totalKader: _kaderCount ?? widget.event.totalKader,
                  visitor: _attendant ?? widget.event.visitor,
                  urlImage: _urlImage ?? widget.event.urlImage);
              final response = await KaderEventService().updateEvent(event);
              if (response != null) {
                showCustomSnackbar(context, 'Berhasil menyimpan acara', 0);
              } else {
                showCustomSnackbar(context, 'Gagal menyimpan acara', 2);
              }
            }),
        const Padding(padding: EdgeInsets.only(top: 20)),
        SubmitButton(
            text: 'Tandai Sebagai Selesai',
            backgroundColor: const GlobalTheme().secondaryColor,
            onClick: () async {
              final response = await KaderEventService()
                  .updateEvent(widget.event.copyWith(isFinish: true));
              if (response != null) {
                showCustomSnackbar(context, 'Berhasil menyelesaikan acara', 0);
                router.push('/login-kader/dashboard-kader');
              } else {
                showCustomSnackbar(context, 'Gagal menyelesaikan acara', 2);
              }
            })
      ],
    );
  }
}
