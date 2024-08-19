import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_nude.dart';
import 'package:sizer/sizer.dart';

class ListviewCheckup extends StatelessWidget {
  final List<KaderCheckup> checkupList;
  const ListviewCheckup({
    super.key,
    required this.checkupList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              color: Colors.white,
              height: 1.5.h,
            ),
        itemBuilder: (context, index) {
          return ItemListViewNude(
              uid: checkupList[index].uid,
              title: checkupList[index].checkupTitle,
              isFinish: checkupList[index].isFinish,
              description:
                  checkupList[index].dateEvent.toString().substring(0, 10));
        },
        itemCount: checkupList.length);
  }
}
