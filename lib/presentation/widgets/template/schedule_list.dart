import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/remaja_checkup_service.dart';
import 'package:simanja_app/presentation/widgets/atom/checkup_listview.dart';
import 'package:simanja_app/presentation/widgets/atom/template_title.dart';
import 'package:simanja_app/utils/default_account.dart';

class ScheduleList extends StatelessWidget {
  const ScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FutureBuilder(
          future: RemajaCheckupService().getCheckupList(remajaAccount.uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return Column(
                children: [
                  TemplateTitle(text: 'Jadwal Checkup Posyandu'),
                  CheckupListview(item: snapshot.data![0], onTap: (d) {})
                ],
              );
            }
            return const Text('No Data');
          }),
    );
  }
}
