import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_searchbar.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_activity.dart';

class ActivityList extends StatelessWidget {
  final List<EventKader>? items;
  const ActivityList({super.key, this.items});

  final Widget isEmpty = const Text('Tidak ada kegiatan posyandu');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          const CustomSearchBar(label: 'Judul Kegiatan', icon: Icons.search),
          const Padding(padding: EdgeInsets.only(top: 20)),
          if (items == null || items!.isEmpty)
            isEmpty
          else
            Center(
              child: ListviewActivity(
                itemsEvent: items,
              ),
            )
        ],
      ),
    );
  }
}
