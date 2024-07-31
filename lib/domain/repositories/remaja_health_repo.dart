import 'package:simanja_app/domain/entities/remaja_health.dart';

abstract class RemajaHealthRepo {
  Future<List<HealthPropertiesRemaja>> getHealths();
  Future<HealthPropertiesRemaja> getHealthByUID(String uid);

  Future<HealthPropertiesRemaja?> createHealth(HealthPropertiesRemaja health);
  Future<HealthPropertiesRemaja?> updateHealth(HealthPropertiesRemaja health);
  Future<bool?> deleteHealth(HealthPropertiesRemaja health);
}
