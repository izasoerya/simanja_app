import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/domain/services/kadet_event_service.dart';
import 'package:simanja_app/domain/services/remaja_checkup_service.dart';
import 'package:simanja_app/domain/services/remaja_event_service.dart';
import 'package:simanja_app/presentation/widgets/organism/appbar_content.dart';
import 'package:simanja_app/presentation/widgets/template/checkup_confirmation.dart';
import 'package:simanja_app/presentation/widgets/template/schedule_list.dart';
import 'package:simanja_app/utils/default_account.dart';

class CheckupData {
  final List<KaderCheckup> checkupList;
  final List<EventKader> eventList;

  CheckupData({required this.checkupList, required this.eventList});
}

class SubscribeData {
  final List<KaderCheckup> subscribeCheckup;
  final List<EventKader> subscribeEvent;

  SubscribeData({required this.subscribeCheckup, required this.subscribeEvent});
}

class DashboardRemaja extends StatefulWidget {
  const DashboardRemaja({super.key});

  @override
  State<DashboardRemaja> createState() => _DashboardRemajaState();
}

class _DashboardRemajaState extends State<DashboardRemaja> {
  void _refreshPage() => setState(() {});

  Future<CheckupData?> _fetchCheckupList() async {
    final eventList =
        await KaderEventService().getActiveEventList(remajaAccount.posyandu);
    final checkupList = await KaderCheckupService()
        .getActiveCheckupList(remajaAccount.posyandu);
    return CheckupData(checkupList: checkupList, eventList: eventList);
  }

  Future<SubscribeData?> _fetchSubscribeList() async {
    final subscribeCheckup = await RemajaCheckupService()
        .getSubscribeList(remajaAccount.posyandu, remajaAccount.uid);
    final subscribeEvent = await RemajaEventService()
        .getSubscribeList(remajaAccount.posyandu, remajaAccount.uid);
    return SubscribeData(
        subscribeCheckup: subscribeCheckup!, subscribeEvent: subscribeEvent!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
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
                  final checkupData = snapshot.data as CheckupData;
                  return CheckupConfirmation(
                    itemsCheckup: checkupData.checkupList,
                    itemsEvent: checkupData.eventList,
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
                  final subscribeData = snapshot.data as SubscribeData;
                  return ScheduleList(
                    itemsCheckup: subscribeData.subscribeCheckup,
                    itemsEvent: subscribeData.subscribeEvent,
                  );
                }
                return const ScheduleList();
              },
            ),
          ],
        ),
      ),
    );
  }
}
