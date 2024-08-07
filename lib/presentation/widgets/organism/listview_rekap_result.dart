import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_health.dart';

class RekapResultList extends StatelessWidget {
  final List<HealthPropertiesRemaja?> healths;
  final String label;
  const RekapResultList({
    super.key,
    required this.healths,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: healths.length,
        separatorBuilder: (context, index) =>
            const Divider(height: 10, color: Colors.white),
        itemBuilder: (context, index) {
          // TODO: Create new ListView
          return ItemListViewHealth(health: healths[index]!, label: label);
        });
  }
}
