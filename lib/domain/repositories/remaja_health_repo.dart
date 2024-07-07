import 'package:simanja_app/domain/entities/remaja_health.dart';

abstract class RemajaHealthRepo {
  Future<List<HealthPropertiesRemaja>> getHealths();
  Future<HealthPropertiesRemaja> getHealthById(String id);

  Future<void> createHealth(HealthPropertiesRemaja health);
  Future<void> updateHealth(HealthPropertiesRemaja health);
  Future<void> deleteHealth(HealthPropertiesRemaja health);
}
