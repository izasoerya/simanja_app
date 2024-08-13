import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_image.dart';

class ListviewAllEvent extends ConsumerWidget {
  final List<KaderCheckup>? itemsCheckup;
  final List<EventKader>? itemsEvent;
  const ListviewAllEvent({super.key, this.itemsCheckup, this.itemsEvent});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mergedItems = [
      ...?itemsCheckup,
      ...?itemsEvent,
    ];

    double baseHeight = 75.0;
    double maxHeight = MediaQuery.of(context).size.height * 0.3;
    double calculatedHeight = baseHeight * mergedItems.length;

    double finalHeight =
        calculatedHeight > maxHeight ? maxHeight : calculatedHeight;

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: finalHeight,
      child: ListView.separated(
        itemCount: mergedItems.length,
        separatorBuilder: (context, index) => const Divider(height: 20),
        itemBuilder: (context, index) {
          final item = mergedItems[index];
          if (item is KaderCheckup) {
            return ItemListviewImage(
              title: item.checkupTitle,
              uid: item.uid,
              descriptions: [item.dateEvent.toString().substring(0, 10)],
              onTap: (_) {
                router
                    .push('/login-kader/rekap-checkup?checkupUID=${item.uid}');
              },
            );
          } else if (item is EventKader) {
            return SizedBox(
              child: ItemListviewImage(
                title: item.name,
                uid: item.id,
                image: item.urlImage == null || item.urlImage!.isEmpty
                    ? null
                    : Image.network(item.urlImage!),
                descriptions: [
                  item.description,
                  '${item.topic} | ${item.date.toString().substring(0, 10)}',
                ],
                onTap: (_) {
                  router.push(
                      '/login-kader/edit-data-activity?activityUID=${item.id}');
                },
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
