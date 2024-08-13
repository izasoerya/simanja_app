import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_activity.dart';

class ListviewActivity extends StatelessWidget {
  final List<EventKader> items;
  const ListviewActivity({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      alignment: Alignment.center,
      child: ListView.separated(
          itemBuilder: (context, index) {
            final item = items[index];
            return ItemListViewActivity(
                title: item.name,
                description: [item.topic, item.description],
                date: item.date);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: items.length),
    );
  }
}
