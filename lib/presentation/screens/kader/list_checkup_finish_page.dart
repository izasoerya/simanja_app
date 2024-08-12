import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_checkup.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';
import 'package:simanja_app/utils/default_account.dart';

class ListCheckupFinishPage extends StatelessWidget {
  const ListCheckupFinishPage({super.key});

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
                title: 'Daftar Layanan Kesehatan Telah Selesai',
                description:
                    'Berikut merupakan daftar layanan kesehatan yang telah selesai dilakukan oleh posyandu'),
            const Padding(padding: EdgeInsets.only(top: 30)),
            FutureBuilder(
              future: KaderCheckupService()
                  .getDeactiveCheckupList(kaderAccount.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return SizedBox(
                      height: screenHegiht,
                      child: ListviewCheckup(
                        checkupList: snapshot.data!,
                      ));
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
