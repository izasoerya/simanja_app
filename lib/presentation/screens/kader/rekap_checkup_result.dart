import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/remaja_heath_service.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_nude.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';

class RekapCheckupResult extends StatelessWidget {
  final String checkupUID;
  const RekapCheckupResult({super.key, required this.checkupUID});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                future: RemajaHeathService().getListCheckupHealth(checkupUID),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    final healthData =
                        snapshot.data!.where((e) => e!.anemia == true).toList();
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: ListView.separated(
                          itemCount: healthData.length,
                          separatorBuilder: (context, index) =>
                              const Divider(height: 10),
                          itemBuilder: (context, index) {
                            // TODO: Create new ListView
                            return ItemListViewNude(
                                title: '${healthData[index]!.uidRemaja}',
                                description: '${healthData[index]!.anemia}',
                                isFinish: true,
                                uid: '');
                          }),
                    );
                  }
                  return const Text('Data tidak ditemukan');
                }),
          ],
        ),
      ),
    );
  }
}
