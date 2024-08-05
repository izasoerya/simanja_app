import 'package:simanja_app/domain/entities/kader_event.dart';

abstract class RemajaEventRepo {
  Future<List<EventKader>?> getEventList(String posyanduUID);
  Future<List<EventKader>?> getSubscribeList(
      String posyanduUID, String remajaUID);

  Future<void> subscribeCheckup(String eventUID, String remajaUID);
  Future<void> unsubscribeCheckup(String eventUID, String remajaUID);
}
