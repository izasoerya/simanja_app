import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/presentation/provider/provider_index_page.dart';
import 'package:simanja_app/presentation/provider/provider_user.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/horizontal_datepicker.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/template_title.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_activity.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_posyandu.dart';

class ActivityPage extends ConsumerStatefulWidget {
  const ActivityPage({super.key});

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends ConsumerState<ActivityPage> {
  DateTime _date = DateTime.now();
  _onDateChange(DateTime date) => _date = date;

  String _name = '';
  _onNameChange(String name) => _name = name;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) => changePageIndex(ref, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TitleWPosyandu(title: 'KEGIATAN POSYANDU'),
            const Padding(padding: EdgeInsets.only(top: 30)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TemplateTitle(
                    text: 'Jadwalkan Posyandu',
                    fontSize: 18,
                  ),
                  Icon(Icons.history, size: 30),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            HorizontalDatePicker(onDateChange: _onDateChange),
            const Padding(padding: EdgeInsets.only(top: 15)),
            TextInput(
                hintText: 'Nama Acara...',
                labelText: 'Nama Acara',
                value: _onNameChange),
            const Padding(padding: EdgeInsets.only(top: 5)),
            SubmitButton(
                text: 'Jadwalkan',
                backgroundColor: GlobalTheme().primaryColor,
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
            const Padding(padding: EdgeInsets.only(top: 30)),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TemplateTitle(
                        text: 'Acara Sedang Berlangsung', fontSize: 18),
                    Icon(Icons.history, size: 30),
                  ],
                )),
            const Padding(padding: EdgeInsets.only(top: 15)),
            const ListviewActivity(),
          ],
        ),
      ),
    );
  }
}
