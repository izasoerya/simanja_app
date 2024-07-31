import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/registration_listview.dart';
import 'package:simanja_app/presentation/widgets/atom/template_title.dart';

class ScheduleList extends StatelessWidget {
  final List<KaderCheckup> items;
  const ScheduleList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: const GlobalTheme().primaryColorLight,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Divider(
              color: Colors.white,
              height: 25,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return RegistrationListview(
                item: items[index],
                checkBox: false,
                onTap: (_) {},
              );
            },
          ),
        ),
      ],
    );
  }
}
