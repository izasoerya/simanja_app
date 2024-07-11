import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/presentation/widgets/atom/template_title.dart';
import 'package:simanja_app/presentation/widgets/organism/appbar_content.dart';
import 'package:simanja_app/presentation/widgets/template/dashboard_content.dart';
import 'package:simanja_app/presentation/widgets/template/summary_remaja.dart';

class DashboardKader extends ConsumerWidget {
  const DashboardKader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppbarContent(),
              const Padding(padding: EdgeInsets.only(top: 30)),
              const TemplateTitle(text: 'DASHBOARD'),
              const Padding(padding: EdgeInsets.only(top: 15)),
              const DashboardContent(),
              const TemplateTitle(text: 'REKAP KONDISI REMAJA'),
              const Padding(padding: EdgeInsets.only(top: 15)),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const SummaryRemaja(
                      leftText: 'HARI INI', rightText: 'SEMUA')),
              const Padding(padding: EdgeInsets.only(top: 50)),
              const TemplateTitle(text: 'KEGIATAN POSYANDU'),
              const Padding(padding: EdgeInsets.only(top: 50)),
            ],
          ),
        ),
      ),
    );
  }
}
