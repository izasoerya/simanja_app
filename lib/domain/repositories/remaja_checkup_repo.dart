import 'package:simanja_app/domain/entities/kader_checkup.dart';

abstract class RemajaCheckupRepo {
  Future<List<KaderCheckup>> getCheckupList(String uid);

  Future<List<String>?> subscribeCheckup(String checkupUID, String remajaUID);
  Future<KaderCheckup?> deleteCheckup(String checkupUID, String remajaUID);
}
