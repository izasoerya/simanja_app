import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/infrastructure/iremaja_checkup.dart';

class RemajaCheckupService {
  Future<void> subscribeCheckups(String checkupUID, String remajaID) async {
    await RemajaCheckupImplementation().subscribeCheckup(checkupUID, remajaID);
  }

  Future<void> unsubscribeCheckups(String checkupUID, String remajaID) async {
    await RemajaCheckupImplementation()
        .unsubscribeCheckup(checkupUID, remajaID);
  }

  Future<List<KaderCheckup>?> getCheckupList(String posyanduUID) async {
    return await RemajaCheckupImplementation().getCheckupList(posyanduUID);
  }

  Future<List<KaderCheckup>?> getSubscribeList(
      String posyanduUID, String remajaUID) async {
    return await RemajaCheckupImplementation()
        .getSubscribeList(posyanduUID, remajaUID);
  }
}
