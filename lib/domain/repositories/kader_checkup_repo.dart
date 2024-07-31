import 'package:simanja_app/domain/entities/kader_checkup.dart';

abstract class KaderCheckupRepo {
  Future<KaderCheckup> getCheckupbyUID(String checkupUID);
  Future<List<KaderCheckup>> getCheckups(String uid);

  Future<void> createCheckup(String title, DateTime date, String kaderUID);
  Future<KaderCheckup?> updateCheckup(KaderCheckup activity);
  Future<void> deleteCheckup(KaderCheckup activity);
}
