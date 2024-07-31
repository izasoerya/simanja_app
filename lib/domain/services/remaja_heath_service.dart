import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/infrastructure/iremaja_health.dart';

class RemajaHeathService {
  Future<HealthPropertiesRemaja?> getRemajaHealth(String uid) async {
    return await RemajaHealthImplementation().getHealthByUID(uid);
  }

  Future<List<HealthPropertiesRemaja>> getRemajaHealths() async {
    return await RemajaHealthImplementation().getListHealth();
  }

  Future<List<HealthPropertiesRemaja?>> getListCheckupHealth(
      String checkupUID) async {
    return await RemajaHealthImplementation()
        .getListHealthByCheckupUID(checkupUID);
  }
}
