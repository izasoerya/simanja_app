import 'package:simanja_app/domain/entities/remaja_health.dart';

abstract class RemajaHealthRepo {
  Future<List<HealthPropertiesRemaja>> getListHealth();
  Future<HealthPropertiesRemaja?> getHealthByUID(String uid);
  Future<HealthPropertiesRemaja?> getHealthbyCheckupUID(
      String checkupUID, String remajaUID, DateTime date);
  Future<List<HealthPropertiesRemaja?>?> getListHealthByCheckupUID(
      String checkupUID);

  Future<HealthPropertiesRemaja?> createHealth(HealthPropertiesRemaja health);
  Future<HealthPropertiesRemaja?> updateHealth(HealthPropertiesRemaja health);
  Future<bool?> deleteHealth(HealthPropertiesRemaja health);
}
