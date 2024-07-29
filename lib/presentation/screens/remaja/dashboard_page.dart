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

  Future<Map<String, dynamic>> _fetchData() async {
    final checkupList =
        await RemajaCheckupService().getCheckupList(remajaAccount.posyandu);
    final subscribeList = await RemajaCheckupService()
        .getSubscribeList(remajaAccount.posyandu, remajaAccount.uid);
    return {
      'checkupList': checkupList,
      'subscribeList': subscribeList,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          var data = snapshot.data!;
          List<KaderCheckup> checkupList = data['checkupList'];
          List<KaderCheckup> subscribeList = data['subscribeList'];
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppbarContent(isKader: false),
                const Padding(padding: EdgeInsets.only(top: 20)),
                CheckupConfirmation(items: checkupList, onTap: _refreshPage),
                const Padding(padding: EdgeInsets.only(top: 30)),
                ScheduleList(items: subscribeList),
              ],
            ),
          );
        }
        return const Center(
          child: Text('Tidak ada data'),
        );
      },
    );
  }
}
