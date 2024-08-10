import 'package:flutter/material.dart';
import 'package:simanja_app/domain/services/kadet_event_service.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';

class EventResultPage extends StatelessWidget {
  final String eventUID;
  const EventResultPage({super.key, required this.eventUID});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: FutureBuilder(
          future: KaderEventService().getEvent(eventUID),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              final event = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: screenHeight * 0.03)),
                  TitleWDescription(
                      title: event.name, description: event.topic),
                  Padding(padding: EdgeInsets.only(top: screenHeight * 0.03)),
                  Text(
                      'Tanggal pelaksanaan: ${event.date.toString().substring(0, 10)}'),
                  Text(event.note),
                  Padding(padding: EdgeInsets.only(top: screenHeight * 0.03)),
                  Text('Daftar peserta: ${event.visitor}'),
                  Text('Daftar kader: ${event.totalKader}'),
                ],
              );
            }
            return const Text('Error');
          }),
    );
  }
}
