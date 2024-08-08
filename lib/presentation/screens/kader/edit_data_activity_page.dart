import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/kadet_event_service.dart';
import 'package:simanja_app/presentation/widgets/template/edit_schedule_checkup.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';

class EditDataActivityPage extends StatelessWidget {
  final String activityUID;
  const EditDataActivityPage({super.key, required this.activityUID});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 30)),
            const TitleWDescription(
                title: 'KEGIATAN POSYANDU',
                description: 'Edit data kegiatan posyandu'),
            const Padding(padding: EdgeInsets.only(top: 30)),
            FutureBuilder(
                future: KaderEventService().getEvent(activityUID),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    return EditScheduleCheckup(event: snapshot.data!);
                  }
                  return const Text('Error');
                }),
            const Padding(padding: EdgeInsets.only(top: 30)),
          ],
        ),
      ),
    );
  }
}
