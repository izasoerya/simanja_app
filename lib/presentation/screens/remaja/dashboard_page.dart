import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/services/remaja_checkup_service.dart';
import 'package:simanja_app/presentation/widgets/organism/appbar_content.dart';
import 'package:simanja_app/presentation/widgets/template/checkup_confirmation.dart';
import 'package:simanja_app/presentation/widgets/template/schedule_list.dart';
import 'package:simanja_app/utils/default_account.dart';

class DashboardRemaja extends StatefulWidget {
  const DashboardRemaja({super.key});

  @override
  State<DashboardRemaja> createState() => _DashboardRemajaState();
}

class _DashboardRemajaState extends State<DashboardRemaja> {
  void _refreshPage() => setState(() {});

  Future<List<KaderCheckup>?> _fetchCheckupList() async {
    return await RemajaCheckupService().getCheckupList(remajaAccount.posyandu);
  }

  Future<List<KaderCheckup>?> _fetchSubscribeList() async {
    return await RemajaCheckupService()
        .getSubscribeList(remajaAccount.posyandu, remajaAccount.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppbarContent(isKader: false),
          const Padding(padding: EdgeInsets.only(top: 20)),
          FutureBuilder(
            future: _fetchCheckupList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return CheckupConfirmation(
                  items: snapshot.data!,
                  onTap: _refreshPage,
                );
              }
              return const Center(child: Text('Tidak ada data'));
            },
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
          FutureBuilder(
            future: _fetchSubscribeList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return ScheduleList(items: snapshot.data!);
              }
              return const ScheduleList(items: []);
            },
          ),
        ],
      ),
    );
  }
}
