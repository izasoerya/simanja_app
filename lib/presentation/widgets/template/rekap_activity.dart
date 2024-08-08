import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_image.dart';

class RekapActivity extends StatelessWidget {
  final List<EventKader>? itemsEvent;
  final List<KaderCheckup>? itemsCheckup;
  const RekapActivity({super.key, this.itemsEvent, this.itemsCheckup});

  @override
  Widget build(BuildContext context) {
    final combinedItems = <dynamic>[];
    if (itemsEvent != null) combinedItems.addAll(itemsEvent!);
    if (itemsCheckup != null) combinedItems.addAll(itemsCheckup!);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.separated(
        itemCount: combinedItems.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = combinedItems[index];
          String title;
          String uid;
          List<String> descriptions;
          void Function(String d) onTap;

          if (item is EventKader) {
            title = item.name;
            uid = item.id;
            descriptions = [
              item.description,
              '${item.date.toString().substring(0, 10)} | Aktivitas Lain'
            ];
            onTap = (_) =>
                router.push('/login-kader/result-data-activity?eventUID=$uid');
          } else if (item is KaderCheckup) {
            title = item.checkupTitle;
            uid = item.uid;
            descriptions = [
              '${item.dateEvent.toString().substring(0, 10)} | Checkup'
            ];
            onTap = (_) =>
                router.push('/login-kader/rekap-checkup?checkupUID=$uid');
          } else {
            title = 'Unknown';
            uid = 'Unknown';
            descriptions = ['Unknown'];
            onTap = (_) {};
          }

          return ItemListviewImage(
              title: title, uid: uid, descriptions: descriptions, onTap: onTap);
        },
      ),
    );
  }
}
