import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TemplateTitle(text: 'Acara Sedang Berlangsung', fontSize: 18),
              Icon(Icons.history, size: 30),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 15)),
        ListviewActivity(
          itemsCheckup: itemsCheckup,
          itemsEvent: itemsEvent,
        ),
      ],
    );
  }
}
