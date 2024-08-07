import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_searchbar.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_activity.dart';

class ActivityList extends StatelessWidget {
  final List<EventKader>? items;
  const ActivityList({super.key, this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          const CustomSearchBar(label: 'Judul Kegiatan', icon: Icons.search),
          const Padding(padding: EdgeInsets.only(top: 20)),
          items != null
              ? Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ListviewActivity(
                        itemsEvent: items,
                      ),
                    ),
                  ],
                )
              : const Text('Tidak ada kegiatan posyandu')
        ],
      ),
    );
  }
}
