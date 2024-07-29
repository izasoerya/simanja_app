import 'package:simanja_app/domain/entities/kader_checkup.dart';

abstract class RemajaCheckupRepo {
  Future<List<KaderCheckup>?> getCheckupList(String posyanduUID);
  Future<List<KaderCheckup>?> getSubscribeList(
      String posyanduUID, String remajaUID);

  Future<void> subscribeCheckup(String checkupUID, String remajaUID);
  Future<void> unsubscribeCheckup(String checkupUID, String remajaUID);
}
