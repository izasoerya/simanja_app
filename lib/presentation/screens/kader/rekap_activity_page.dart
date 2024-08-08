import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/domain/services/kadet_event_service.dart';
import 'package:simanja_app/presentation/widgets/template/rekap_activity.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';
import 'package:simanja_app/utils/default_account.dart';

class RekapActivityPage extends StatelessWidget {
  const RekapActivityPage({super.key});

  Future<List<dynamic>> _fetchData() async {
    try {
      final dataCheckup =
          KaderCheckupService().getCheckupList(kaderAccount.uid);
      final dataEvent = KaderEventService().getEventList(kaderAccount.uid);
      return await Future.wait([dataCheckup, dataEvent]);
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: screenHeight * 0.025)),
            const TitleWDescription(
                title: 'DAFTAR KEGIATAN POSYANDU',
                description:
                    'Daftar kegiatan yang telah dilakukan oleh posyandu'),
            Padding(padding: EdgeInsets.only(top: screenHeight * 0.025)),
            FutureBuilder<List<dynamic>>(
              future: _fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  final itemsCheckup = snapshot.data![0];
                  final itemsEvent = snapshot.data![1];
                  return RekapActivity(
                    itemsEvent: itemsEvent,
                    itemsCheckup: itemsCheckup,
                  );
                }
                return const Text('No data available');
              },
            ),
          ],
        ),
      ),
    );
  }
}
