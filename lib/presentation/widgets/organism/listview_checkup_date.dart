import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_icon.dart';

class ListviewCheckupDate extends StatelessWidget {
  final List<KaderCheckup>? itemsCheckup;
  final List<EventKader>? itemsEvent;
  const ListviewCheckupDate({
    super.key,
    this.itemsCheckup,
    this.itemsEvent,
  });

  @override
  Widget build(BuildContext context) {
    List<KaderCheckup> filteredCheckupItems = [];
    List<EventKader> filteredEventItems = [];

    if (itemsCheckup != null && itemsCheckup!.isNotEmpty) {
      filteredCheckupItems =
          itemsCheckup!.where((e) => e.isFinish == false).toList();
    }

    if (itemsEvent != null && itemsEvent!.isNotEmpty) {
      filteredEventItems =
          itemsEvent!.where((e) => e.isFinish == false).toList();
    }

    if (filteredCheckupItems.isEmpty && filteredEventItems.isEmpty) {
      return const Text(
        'No data',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => const Divider(
        color: Colors.white,
        height: 25,
      ),
      itemCount: filteredCheckupItems.length + filteredEventItems.length,
      itemBuilder: (context, index) {
        if (index < filteredCheckupItems.length) {
          return ItemListviewIcon(
            title: filteredCheckupItems[index].checkupTitle,
            location: 'Tanggal Checkup',
            date: filteredCheckupItems[index].dateEvent,
          );
        } else {
          int eventIndex = index - filteredCheckupItems.length;
          return ItemListviewIcon(
            title: filteredEventItems[eventIndex].topic,
            location: filteredEventItems[eventIndex].location,
            date: filteredEventItems[eventIndex].date,
          );
        }
      },
    );
  }
}
