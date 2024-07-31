import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/infrastructure/iremaja_health.dart';

class RemajaHeathService {
  Future<HealthPropertiesRemaja?> getRemajaHeath(String uid) async {
    return await RemajaHealthImplementation().getHealthByUID(uid);
  }

  Future<List<HealthPropertiesRemaja>> getRemajaHeaths() async {
    return await RemajaHealthImplementation().getHealths();
  }
}
