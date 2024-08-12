import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
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

  Future<List<KaderCheckup>> getDeactiveCheckupList(String posyanduUID) async {
    List<KaderCheckup> data =
        await KaderCheckupImplementation().getCheckups(posyanduUID);
    final activeCheckup =
        data.where((element) => element.isFinish == true).toList();
    return activeCheckup;
  }

  Future<List<UserRemaja>?> getRemajaCheckupList(String checkupUID) async {
    List<String>? listRemaja =
        await KaderCheckupImplementation().getRemajaCheckupList(checkupUID);
    if (listRemaja == null) {
      return null;
    }
    List<UserRemaja> data = [];
    for (var element in listRemaja) {
      UserRemaja? remaja = await RemajaAuthentication().getUserbyUID(element);
      if (remaja != null) {
        data.add(remaja);
      }
    }
    return data;
  }

  Future<KaderCheckup?> updateCheckupStatus(KaderCheckup checkup) async {
    KaderCheckup? data =
        await KaderCheckupImplementation().updateCheckup(checkup);
    return data;
  }
}
