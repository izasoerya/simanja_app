import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/domain/repositories/remaja_health_repo.dart';

class RemajaHealthImplementation implements RemajaHealthRepo {
  @override
  Future<HealthPropertiesRemaja?> createHealth(HealthPropertiesRemaja health) {
    // TODO: implement createHealth
    throw UnimplementedError();
  }

  @override
  Future<bool?> deleteHealth(HealthPropertiesRemaja health) {
    // TODO: implement deleteHealth
    throw UnimplementedError();
  }

  @override
  Future<HealthPropertiesRemaja> getHealthByUID(String uid) {
    // TODO: implement getHealthByUID
    throw UnimplementedError();
  }

  @override
  Future<List<HealthPropertiesRemaja>> getHealths() {
    // TODO: implement getHealths
    throw UnimplementedError();
  }

  @override
  Future<HealthPropertiesRemaja?> updateHealth(HealthPropertiesRemaja health) {
    // TODO: implement updateHealth
    throw UnimplementedError();
  }
}
