import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/infrastructure/iremaja_health.dart';

class RemajaHealthService {
  Future<HealthPropertiesRemaja?> upsertRemajaHealth(
      HealthPropertiesRemaja health,
      String remajaUID,
      String checkupUID,
      DateTime date) async {
    final response = await RemajaHealthImplementation()
        .getHealthbyCheckupUID(checkupUID, remajaUID, date);
    if (response != null) {
      // health.uid = response.uid;
      final newData = health.copyWith(
        uid: response.uid,
      );
      return await RemajaHealthImplementation().updateHealth(newData);
    }
    return await RemajaHealthImplementation().createHealth(health);
  }

  Future<HealthPropertiesRemaja?> getRemajaHealthbyUID(String uid) async {
    return await RemajaHealthImplementation().getHealthByUID(uid);
  }

  Future<List<HealthPropertiesRemaja>> getRemajaHealths() async {
    return await RemajaHealthImplementation().getListHealth();
  }

  Future<List<HealthPropertiesRemaja?>?> getListCheckupHealth(
      String checkupUID) async {
    return await RemajaHealthImplementation()
        .getListHealthByCheckupUID(checkupUID);
  }
}
