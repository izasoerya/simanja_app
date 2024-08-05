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
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => const Divider(
        color: Colors.white,
        height: 25,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ItemListviewIcon(
          title: items[index].checkupTitle,
          location: kaderAccount.namePosyandu,
          date: items[index].dateEvent,
        );
      },
    );
  }
}
