import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/domain/services/remaja_heath_service.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_rekap_checkup.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';

class AttendanceCheckupPage extends StatelessWidget {
  final String checkupUID;
  const AttendanceCheckupPage({super.key, required this.checkupUID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: const GlobalTheme().primaryColor,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'REKAP KONDISI KESEHATAN REMAJA',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            padding: const EdgeInsets.only(left: 15),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
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
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasData) {
                            final items = snapshot.data!;
                            return ListViewRekapCheckup(
                              items: items,
                              checkupDate: kaderChekcupData.dateEvent,
                              isFinish: kaderChekcupData.isFinish,
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
        ),
      ),
    );
  }
}
