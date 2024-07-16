import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/presentation/provider/provider_index_page.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/horizontal_datepicker.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/template_title.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_posyandu.dart';

class ActivityPage extends ConsumerWidget {
  const ActivityPage({super.key});

  _onDateChange(DateTime date) => date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      onPopInvoked: (didPop) => changePageIndex(ref, 0),
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
          SubmitButton(
              text: 'Jadwalkan',
              backgroundColor: GlobalTheme().primaryColor,
              onClick: () {})
        ],
      ),
    );
  }
}
