import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_all_event.dart';

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
          const Padding(padding: EdgeInsets.only(top: 5)),
          if (items == null || items!.isEmpty)
            isEmpty
          else
            Center(
              child: ListviewAllEvent(
                itemsEvent: items,
              ),
            )
        ],
      ),
    );
  }
}
