import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';

class ListviewCheckup extends StatelessWidget {
  final List<KaderCheckup> checkupList;
  const ListviewCheckup({
    super.key,
    required this.checkupList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return Text(checkupList[index].checkupTitle);
        },
        itemCount: checkupList.length);
  }
}
