import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_image.dart';

class ListviewActivity extends ConsumerWidget {
  final List<KaderCheckup>? itemsCheckup;
  final List<EventKader>? itemsEvent;
  const ListviewActivity({super.key, this.itemsCheckup, this.itemsEvent});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mergedItems = [
      ...?itemsCheckup,
      ...?itemsEvent,
    ];

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.8,
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
              onTap: (data) {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (context, _, __) {
                    return AlertDialog(
                      title: Text(data),
                      content: Text(item.dateEvent.toString()),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Belum Selesai'),
                        ),
                        TextButton(
                          onPressed: () async {
                            final response = await KaderCheckupService()
                                .updateCheckupStatus(item.copyWith(
                                    isFinish: true, dateEvent: DateTime.now()));
                            if (response != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Checkup berhasil diselesaikan')));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Checkup gagal diselesaikan')));
                            }
                            Navigator.of(context).pop();
                          },
                          child: const Text('Selesai'),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          } else if (item is EventKader) {
            return SizedBox(
              child: ItemListviewImage(
                title: item.topic,
                uid: item.id,
                descriptions: [item.date.toString().substring(0, 10)],
                onTap: (data) {
                  // Handle EventKader tap
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
