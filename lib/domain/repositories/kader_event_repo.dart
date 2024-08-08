import 'package:simanja_app/domain/entities/kader_event.dart';

abstract class KaderEventRepo {
  Future<List<EventKader>> getKaderEvents(String idKader);
  Future<EventKader?> getKaderEventById(String id);

  Future<EventKader?> createKaderEvent(EventKader kaderEvent);
  Future<EventKader?> updateKaderEvent(EventKader kaderEvent);
  Future<void> deleteKaderEvent(EventKader kaderEvent);
}
