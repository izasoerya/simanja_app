import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_icon.dart';
import 'package:simanja_app/utils/default_account.dart';

class ListviewCheckupDate extends StatelessWidget {
  const ListviewCheckupDate({
    super.key,
    required this.items,
  });

  final List<KaderCheckup> items;

  @override
  Widget build(BuildContext context) {
    List<KaderCheckup> filteredItem = [];
    if (items.isNotEmpty) {
      filteredItem = items.where((e) => e.isFinish == false).toList();
      return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.white,
          height: 25,
        ),
        itemCount: filteredItem.length,
        itemBuilder: (context, index) {
          return ItemListviewIcon(
            title: filteredItem[index].checkupTitle,
            location: kaderAccount.namePosyandu,
            date: filteredItem[index].dateEvent,
          );
        },
      );
    } else {
      return const Text(
        'Belum mendaftar checkup!',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      );
    }
  }
}
