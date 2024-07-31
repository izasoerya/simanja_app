import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_checkup.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_posyandu.dart';

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
          const TitleWPosyandu(title: 'Rekap Checkup Remaja'),
          FutureBuilder(
              future: null,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return Placeholder();
                }
                return const Text('Belum ada remaja mendaftar');
              }),
        ],
      ),
    );
  }
}
