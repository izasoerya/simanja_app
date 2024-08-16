import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/infrastructure/iremaja_health.dart';

class RemajaHealthService {
  Future<HealthPropertiesRemaja?> upsertRemajaHealth(
      HealthPropertiesRemaja health) async {
    final response = await RemajaHealthImplementation().getHealthbyCheckupUID(
        health.uidCheckup!, health.uidRemaja!, health.checkedAt!);
    if (response != null) {
      health.uid = response.uid;
      return await RemajaHealthImplementation().updateHealth(health);
    }
    return await RemajaHealthImplementation().createHealth(health);
  }

  Future<HealthPropertiesRemaja?> getRemajaHealthbyUID(String uid) async {
    return await RemajaHealthImplementation().getHealthByUID(uid);
  }

  Future<List<HealthPropertiesRemaja>> getRemajaHealths(String uid) async {
    return await RemajaHealthImplementation().getListHealth(uid);
  }

  Future<List<HealthPropertiesRemaja?>?> getListCheckupHealth(
      String checkupUID) async {
    return await RemajaHealthImplementation()
        .getListHealthByCheckupUID(checkupUID);
  }
}
