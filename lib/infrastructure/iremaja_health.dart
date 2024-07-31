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
  Future<bool?> deleteHealth(HealthPropertiesRemaja health) {
    // TODO: implement deleteHealth
    throw UnimplementedError();
  }

  @override
  Future<HealthPropertiesRemaja?> getHealthByUID(String uid) async {
    try {
      final response = await Supabase.instance.client
          .from('health')
          .select()
          .eq('uid', uid)
          .single();
      HealthPropertiesRemaja data = HealthPropertiesRemaja.fromJSON(response);
      return data;
    } catch (e) {
      print('Error:$e');
      return null;
    }
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
