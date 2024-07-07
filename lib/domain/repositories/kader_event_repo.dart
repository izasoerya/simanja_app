import 'package:simanja_app/domain/entities/kader_event.dart';

abstract class KaderEventRepo {
  Future<List<EventKader>> getKaderEvents();
  Future<EventKader> getKaderEventById(String id);

  Future<void> createKaderEvent(EventKader kaderEvent);
  Future<void> updateKaderEvent(EventKader kaderEvent);
  Future<void> deleteKaderEvent(EventKader kaderEvent);
}
