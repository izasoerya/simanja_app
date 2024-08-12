import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/domain/services/kadet_event_service.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/presentation/widgets/atom/template_title.dart';
import 'package:simanja_app/presentation/widgets/organism/appbar_content.dart';
import 'package:simanja_app/presentation/widgets/template/activity_list.dart';
import 'package:simanja_app/presentation/widgets/template/dashboard_content.dart';
import 'package:simanja_app/presentation/widgets/template/rekap_checkup.dart';
import 'package:simanja_app/utils/default_account.dart';

class DashboardKader extends StatelessWidget {
  const DashboardKader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AppbarContent(isKader: true),
            const Padding(padding: EdgeInsets.only(top: 30)),
            const TemplateTitle(text: 'DASHBOARD'),
            const Padding(padding: EdgeInsets.only(top: 15)),
            FutureBuilder(
                future: RemajaAuthentication()
                    .getUsersbyPosyanduID(kaderAccount.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    return DashboardContent(users: snapshot.data!);
                  }
                  return const Text('Error');
                }),
            const Padding(padding: EdgeInsets.only(top: 15)),
            const TemplateTitle(text: 'REKAP PELAYANAN KESEHATAN'),
            const Padding(padding: EdgeInsets.only(top: 15)),
            FutureBuilder(
                future: KaderCheckupService()
                    .getDeactiveCheckupList(kaderAccount.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    return RekapCheckup(checkupList: snapshot.data!);
                  }
                  return const Text('Tidak ada jadwal checkup');
                }),
            const Padding(padding: EdgeInsets.only(top: 30)),
            const TemplateTitle(text: 'KEGIATAN POSYANDU'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            FutureBuilder(
                future:
                    KaderEventService().getDeactiveEventList(kaderAccount.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    return ActivityList(items: snapshot.data!);
                  }
                  return const ActivityList();
                }),
            const Padding(padding: EdgeInsets.only(top: 50)),
          ],
        ),
      ),
    );
  }
}
