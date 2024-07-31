import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/remaja_heath_service.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_rekap_checkup.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';

class AttendanceCheckupPage extends StatelessWidget {
  const AttendanceCheckupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TitleWDescription(
              title: 'REKAP KONDISI KESEHATAN REMAJA',
              description:
                  'Data ini menunjukkan kondisi kesehatan remaja yang telah melakukan cek kesehatan di posyandu'),
          const Padding(padding: EdgeInsets.only(top: 30)),
          FutureBuilder(
              future: RemajaHeathService().getRemajaHeaths(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return ListViewRekapCheckup(items: snapshot.data!);
                }
                return const Text('Belum ada remaja mendaftar');
              }),
        ],
      ),
    );
  }
}
