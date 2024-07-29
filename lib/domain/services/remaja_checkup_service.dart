import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/infrastructure/iremaja_checkup.dart';

class RemajaCheckupService {
  Future<List<String>?> subscribeCheckup(
      String checkupUID, String remajaID) async {
    List<String>? data = await RemajaCheckupImplementation()
        .subscribeCheckup(checkupUID, remajaID);
    return data;
  }

  Future<List<KaderCheckup>>? getCheckupList() {
    return null;
  }
}
