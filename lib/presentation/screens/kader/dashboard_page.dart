import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/presentation/widgets/atom/template_title.dart';
import 'package:simanja_app/presentation/widgets/organism/appbar_content.dart';
import 'package:simanja_app/presentation/widgets/template/activity_list.dart';
import 'package:simanja_app/presentation/widgets/template/dashboard_content.dart';
import 'package:simanja_app/presentation/widgets/template/summary_remaja.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AppbarContent(),
            const Padding(padding: EdgeInsets.only(top: 30)),
            const TemplateTitle(text: 'DASHBOARD'),
            const Padding(padding: EdgeInsets.only(top: 15)),
            const DashboardContent(),
            const Padding(padding: EdgeInsets.only(top: 15)),
            const TemplateTitle(text: 'REKAP KONDISI REMAJA'),
            const Padding(padding: EdgeInsets.only(top: 15)),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const SummaryRemaja(
                    leftText: 'HARI INI', rightText: 'SEMUA')),
            const Padding(padding: EdgeInsets.only(top: 30)),
            const TemplateTitle(text: 'KEGIATAN POSYANDU'),
            const Padding(padding: EdgeInsets.only(top: 15)),
            const ActivityList(),
            const Padding(padding: EdgeInsets.only(top: 50)),
          ],
        ),
      ),
    );
  }
}