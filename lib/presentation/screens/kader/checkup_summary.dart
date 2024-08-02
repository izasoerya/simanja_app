import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/domain/services/remaja_heath_service.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_rekap_checkup.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';

class CheckupSummaryPage extends StatelessWidget {
  final String checkupUID;
  const CheckupSummaryPage({super.key, required this.checkupUID});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: FutureBuilder(
          future: KaderCheckupService().getCheckup(checkupUID),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final kaderChekcupData = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  const TitleWDescription(
                      title: 'REKAP KONDISI KESEHATAN REMAJA',
                      description:
                          'Data ini menunjukkan kondisi kesehatan remaja yang telah melakukan cek kesehatan di posyandu'),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  FutureBuilder(
                    future: RemajaHeathService()
                        .getListCheckupHealth(kaderChekcupData.uid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasData) {
                        final items = snapshot.data!;
                        return ListViewRekapCheckup(
                          items: items,
                          kaderCheckup: kaderChekcupData,
                        );
                      }
                      return const Text('Belum ada remaja mendaftar');
                    },
                  ),
                ],
              );
            }
            return const Text('Data tidak ditemukan');
          },
        ),
      ),
    );
  }
}
