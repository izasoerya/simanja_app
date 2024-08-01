import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/domain/repositories/remaja_health_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemajaHealthImplementation implements RemajaHealthRepo {
  @override
  Future<HealthPropertiesRemaja?> createHealth(HealthPropertiesRemaja health) {
    // TODO: implement createHealth
    throw UnimplementedError();
  }

  @override
  Future<HealthPropertiesRemaja?> updateHealth(HealthPropertiesRemaja health) {
    // TODO: implement updateHealth
    throw UnimplementedError();
  }

  @override
  Future<bool?> deleteHealth(HealthPropertiesRemaja health) {
    // TODO: implement deleteHealth
    throw UnimplementedError();
  }

  @override
  Future<HealthPropertiesRemaja?> getHealthByUID(String uid) async {
    try {
      final response = await Supabase.instance.client
          .from('health_properties_remaja')
          .select('*')
          .eq('uid', uid)
          .single();
      return HealthPropertiesRemaja.fromJSON(response);
    } catch (e) {
      print('Error:$e');
      return null;
    }
  }

  @override
  Future<List<HealthPropertiesRemaja>> getListHealth() async {
    try {
      final response = await Supabase.instance.client
          .from('health_properties_remaja')
          .select('*');
      return response.map((e) => HealthPropertiesRemaja.fromJSON(e)).toList();
    } catch (e) {
      print('Error:$e');
      return [];
    }
  }

  @override
  Future<List<HealthPropertiesRemaja?>> getListHealthByCheckupUID(
      String checkupUID) async {
    try {
      final response = await Supabase.instance.client
          .from('health_properties_remaja')
          .select()
          .eq('checkup_uid', checkupUID);
      return response.map((e) => HealthPropertiesRemaja.fromJSON(e)).toList();
    } catch (e) {
      print('Error:$e');
      return [];
    }
  }
}
