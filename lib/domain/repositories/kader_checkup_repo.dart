import 'package:simanja_app/domain/entities/kader_checkup.dart';

abstract class KaderCheckupRepo {
  Future<KaderCheckup> getCheckupbyDate(DateTime date);
  Future<List<KaderCheckup>> getCheckups(String uid);

  Future<void> createCheckup(String title, DateTime date, String kaderUID);
  Future<void> updateCheckup(KaderCheckup activity);
  Future<void> deleteCheckup(KaderCheckup activity);
}
