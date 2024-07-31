import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_nude.dart';

class ListViewRekapCheckup extends StatelessWidget {
  final List<HealthPropertiesRemaja> items;
  const ListViewRekapCheckup({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => const Divider(
              color: Colors.white,
              height: 10,
            ),
        itemBuilder: (context, index) {
          return ItemListViewNude(
              uid: items[index].uid,
              title: items[index].height.toString(),
              description: items[index].weight.toString());
        },
        itemCount: items.length);
  }
}
