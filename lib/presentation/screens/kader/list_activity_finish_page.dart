import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/kadet_event_service.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_activity.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';
import 'package:simanja_app/utils/default_account.dart';

class ListActivityFinishPage extends StatelessWidget {
  const ListActivityFinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHegiht = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 30)),
            const TitleWDescription(
                title: 'Daftar Aktivitas Posyandu Telah Selesai',
                description:
                    'Berikut merupakan daftar aktivitas kegiatan yang telah selesai dilakukan oleh posyandu'),
            const Padding(padding: EdgeInsets.only(top: 30)),
            FutureBuilder(
              future:
                  KaderEventService().getDeactiveEventList(kaderAccount.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return SizedBox(
                      height: screenHegiht,
                      child: ListviewActivity(items: snapshot.data!));
                }
                return const Text('No users found');
              },
            )
          ],
        ),
      ),
    );
  }
}
