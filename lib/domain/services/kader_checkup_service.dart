import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/infrastructure/ikader_checkup.dart';

class KaderCheckupService {
  Future<KaderCheckup?> scheduleCheckup(
      String title, DateTime date, String uid) async {
    KaderCheckup? data =
        await KaderCheckupImplementation().createCheckup(title, date, uid);
    return data;
  }

  Future<KaderCheckup> getCheckup(String checkupUID) async {
    KaderCheckup data =
        await KaderCheckupImplementation().getCheckupbyUID(checkupUID);
    return data;
  }

  Future<List<KaderCheckup>> getCheckupList(String posyanduUID) async {
    List<KaderCheckup> data =
        await KaderCheckupImplementation().getCheckups(posyanduUID);
    return data;
  }

  Future<List<KaderCheckup>> getActiveCheckupList(String posyanduUID) async {
    List<KaderCheckup> data =
        await KaderCheckupImplementation().getCheckups(posyanduUID);
    final activeCheckup =
        data.where((element) => element.isFinish == false).toList();
    return activeCheckup;
  }

  Future<KaderCheckup?> updateCheckupStatus(KaderCheckup checkup) async {
    KaderCheckup? data =
        await KaderCheckupImplementation().updateCheckup(checkup);
    return data;
  }
}
