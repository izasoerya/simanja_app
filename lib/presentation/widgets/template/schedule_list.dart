import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/remaja_checkup_service.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/checkup_listview.dart';
import 'package:simanja_app/presentation/widgets/atom/template_title.dart';
import 'package:simanja_app/utils/default_account.dart';

class ScheduleList extends StatelessWidget {
  const ScheduleList({super.key});

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
                    fontSize: 24,
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
          child: FutureBuilder(
              future: RemajaCheckupService().getCheckupList(remajaAccount.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.white,
                      height: 25,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return CheckupListview(
                        item: snapshot.data![index],
                        checkBox: false,
                        onTap: (_) {},
                      );
                    },
                  );
                } else {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Text('Tidak ada jadwal checkup',
                        style: GlobalTheme().headerStyle),
                  );
                }
              }),
        ),
      ],
    );
  }
}
