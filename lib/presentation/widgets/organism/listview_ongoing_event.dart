import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/widgets/atom/template_title.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_activity.dart';

class OngoingEvent extends StatelessWidget {
  final List<KaderCheckup>? itemsCheckup;
  final List<EventKader>? itemsEvent;
  const OngoingEvent({super.key, this.itemsCheckup, this.itemsEvent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TemplateTitle(text: 'Sedang Berlangsung', fontSize: 18),
              IconButton(
                icon: const Icon(Icons.history_sharp),
                iconSize: 30,
                onPressed: () => router.push('/login-kader/list-data-activity'),
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        ListviewActivity(
          itemsCheckup: itemsCheckup,
          itemsEvent: itemsEvent,
        ),
      ],
    );
  }
}
