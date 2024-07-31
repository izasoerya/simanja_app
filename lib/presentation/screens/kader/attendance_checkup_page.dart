import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/remaja_heath_service.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_rekap_checkup.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';
import 'package:sizer/sizer.dart';

class AttendanceCheckupPage extends StatelessWidget {
  const AttendanceCheckupPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(60.0), // Set the desired height here
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
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(top: 30)),
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
          ),
        ),
      ),
    );
  }
}
