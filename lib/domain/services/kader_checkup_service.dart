import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/infrastructure/ikader_checkup.dart';

class KaderCheckupService {
  Future<KaderCheckup?> scheduleCheckup(
      String title, DateTime date, String uid) async {
    KaderCheckup? data =
        await KaderCheckupImplementation().createCheckup(title, date, uid);
    return data;
  }

  Future<List<KaderCheckup>> getCheckupList(String uid) async {
    List<KaderCheckup> data =
        await KaderCheckupImplementation().getCheckups(uid);
    return data;
  }
}
