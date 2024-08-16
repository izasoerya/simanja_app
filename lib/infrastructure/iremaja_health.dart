import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/domain/repositories/remaja_health_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class RemajaHealthImplementation implements RemajaHealthRepo {
  final Uuid _uuid = const Uuid();
  @override
  Future<HealthPropertiesRemaja?> createHealth(
      HealthPropertiesRemaja health) async {
    health.uid = _uuid.v4();
    try {
      final response = await Supabase.instance.client
          .from('health_properties_remaja')
          .insert(health.toJSON())
          .select()
          .single();
      return HealthPropertiesRemaja.fromJSON(response);
    } catch (e) {
      print('Error create health:$e');
      return null;
    }
  }

  @override
  Future<HealthPropertiesRemaja?> updateHealth(
      HealthPropertiesRemaja health) async {
    try {
      final responseGET = await Supabase.instance.client
          .from('health_properties_remaja')
          .select()
          .eq('uid', health.uid!)
          .select()
          .single();
      final oldData = HealthPropertiesRemaja.fromJSON(responseGET);
      final newData = oldData.copyWith(
        weight: health.weight,
        height: health.height,
        armCircumference: health.armCircumference,
        abdominalCircumference: health.abdominalCircumference,
        vena: health.vena,
        capillar: health.capillar,
        cholesterol: health.cholesterol,
        hemoglobin: health.hemoglobin,
        tds: health.tds,
        tdd: health.tdd,
        smoker: health.smoker,
        tablet: health.tablet,
        note: health.note,
        checkedAt: health.checkedAt,
      );
      final response = await Supabase.instance.client
          .from('health_properties_remaja')
          .update(newData.toJSON())
          .eq('uid', newData.uid!)
          .select()
          .single();
      return HealthPropertiesRemaja.fromJSON(response);
    } catch (e) {
      print('Error update health:$e');
      return null;
    }
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
      print('Error delete health:$e');
      return null;
    }
  }

  @override
  Future<HealthPropertiesRemaja?> getHealthbyCheckupUID(
      String checkupUID, String remajaUID, DateTime date) async {
    try {
      final response = await Supabase.instance.client
          .from('health_properties_remaja')
          .select()
          .eq('checkup_uid', checkupUID)
          .eq('uid_remaja', remajaUID)
          .eq('checked_at', DateTime.parse(date.toString().substring(0, 10)));
      if (response.isNotEmpty) {
        if (response.length == 1) {
          return HealthPropertiesRemaja.fromJSON(response.first);
        }
        final healthList =
            response.map((e) => HealthPropertiesRemaja.fromJSON(e)).toList();
        healthList.sort(
            (a, b) => b.checkedAt?.compareTo(a.checkedAt ?? DateTime(0)) ?? 0);
        return healthList.first;
      }
      return null;
    } catch (e) {
      print('Error get health:$e');
      return null;
    }
  }

  @override
  Future<List<HealthPropertiesRemaja>> getListHealth(String uid) async {
    try {
      final response = await Supabase.instance.client
          .from('health_properties_remaja')
          .select('*')
          .eq('uid_remaja', uid);
      return response.map((e) => HealthPropertiesRemaja.fromJSON(e)).toList();
    } catch (e) {
      print('Error:$e');
      return [];
    }
  }

  @override
  Future<List<HealthPropertiesRemaja?>?> getListHealthByCheckupUID(
      String checkupUID) async {
    try {
      final response = await Supabase.instance.client
          .from('health_properties_remaja')
          .select()
          .eq('checkup_uid', checkupUID);
      return response.map((e) => HealthPropertiesRemaja.fromJSON(e)).toList();
    } catch (e) {
      print('Error:$e');
      return null;
    }
  }
}
