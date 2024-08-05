import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
import 'package:simanja_app/domain/services/kadet_event_service.dart';
import 'package:simanja_app/presentation/provider/provider_index_page.dart';
import 'package:simanja_app/presentation/widgets/atom/template_title.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_ongoing_event.dart';
import 'package:simanja_app/presentation/widgets/template/schedule_checkup_menu.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_posyandu.dart';
import 'package:simanja_app/utils/default_account.dart';

class ActivityPage extends ConsumerStatefulWidget {
  const ActivityPage({super.key});

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends ConsumerState<ActivityPage> {
  late List<KaderCheckup> _kaderCheckup;
  late List<EventKader> _kaderEvent;

  Future<void> _fetchData() async {
    _kaderCheckup =
        await KaderCheckupService().getActiveCheckupList(kaderAccount.uid);
    _kaderEvent =
        await KaderEventService().getActiveEventList(kaderAccount.uid);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_) => changePageIndex(ref, 0),
      child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(top: 30)),
                const TitleWPosyandu(title: 'KEGIATAN POSYANDU'),
                const Padding(padding: EdgeInsets.only(top: 30)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TemplateTitle(
                        text: 'Jadwalkan Posyandu',
                        fontSize: 18,
                      ),
                      Icon(Icons.history, size: 30),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                const ScheduleCheckup(),
                const Padding(padding: EdgeInsets.only(top: 30)),
                FutureBuilder<void>(
                  future: _fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return OngoingEvent(
                        itemsCheckup: _kaderCheckup,
                        itemsEvent: _kaderEvent,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
