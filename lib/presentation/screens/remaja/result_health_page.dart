import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/remaja_heath_service.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_rekap_result.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';
import 'package:simanja_app/utils/default_account.dart';
import 'package:sizer/sizer.dart';

class ResultHealthPage extends StatelessWidget {
  const ResultHealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 5.h)),
          const TitleWDescription(
            title: 'Hasil Cek Kesehatan',
            description:
                'Berikut adalah hasil cek kesehatan yang telah dilakukan',
          ),
          Padding(padding: EdgeInsets.only(top: 3.h)),
          SizedBox(
            height: 50.h,
            child: FutureBuilder(
                future:
                    RemajaHealthService().getRemajaHealths(remajaAccount.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return RekapResultList(
                      healths: snapshot.data!,
                      label: 'all',
                    );
                  }
                  return const Text('Data not found');
                }),
          ),
        ],
      ),
    );
  }
}
