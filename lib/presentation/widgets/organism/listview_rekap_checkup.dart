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
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.75,
        child: Column(
          children: [
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Anemia: ${items.where((element) => element.anemia).length}',
                uid: 'anemia'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Beresiko KEK: ${items.where((element) => element.kek).length}',
                uid: 'kek'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Obesitas: ${items.where((element) => element.weight > 10).length}',
                uid: 'obesitas'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Sangat Kurus: ${items.where((element) => element.weight < 10).length}',
                uid: 'kurus'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Merokok: ${items.where((element) => element.smoker).length}',
                uid: 'merokok'),
          ],
        ));
  }
}
