import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/template_title.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_checkup_date.dart';

class ScheduleList extends StatelessWidget {
  final List<KaderCheckup>? itemsCheckup;
  final List<EventKader>? itemsEvent;
  const ScheduleList({super.key, this.itemsCheckup, this.itemsEvent});

  @override
  Widget build(BuildContext context) {
    if ((itemsCheckup == null || itemsCheckup!.isEmpty) &&
        (itemsEvent == null || itemsEvent!.isEmpty)) {
      return const Center(child: Text('No data'));
    }

    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const GlobalTheme().primaryColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            alignment: Alignment.centerLeft,
            child: const Row(
              children: [
                Icon(
                  Icons.assignment_rounded,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                TemplateTitle(
                  text: 'Jadwal Checkup Posyandu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            color: const GlobalTheme().primaryColorLight,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Column(
            children: [
              if (itemsCheckup != null && itemsCheckup!.isNotEmpty)
                ListviewCheckupDate(itemsCheckup: itemsCheckup!),
              if (itemsEvent != null && itemsEvent!.isNotEmpty)
                ListviewCheckupDate(itemsEvent: itemsEvent!),
            ],
          ),
        ),
      ],
    );
  }
}
