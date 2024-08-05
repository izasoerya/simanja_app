import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/infrastructure/iremaja_event.dart';

class RemajaEventService {
  Future<void> subscribeEvent(String eventUID, String remajaUID) async {
    await RemajaEventImplementation().subscribeCheckup(eventUID, remajaUID);
  }

  Future<void> unsubscribeEvent(String eventUID, String remajaUID) async {
    await RemajaEventImplementation().unsubscribeCheckup(eventUID, remajaUID);
  }

  Future<List<EventKader>?> getSubscribeList(
      String posyanduUID, String remajaUID) async {
    return await RemajaEventImplementation()
        .getSubscribeList(posyanduUID, remajaUID);
  }
}
