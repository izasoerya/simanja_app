import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/repositories/remaja_checkup_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemajaCheckupImplementation implements RemajaCheckupRepo {
  @override
  Future<void> subscribeCheckup(String checkupUID, String remajaUID) async {
    // TODO: LEARN TO USE RPC AND RETURNING
    try {
      await Supabase.instance.client.rpc('append_to_uid_remaja', params: {
        'checkup_uid': checkupUID,
        'new_uid_remaja': remajaUID,
      });
    } catch (e) {
      print('error: $e');
      rethrow;
    }
  }

  @override
  Future<void> unsubscribeCheckup(String checkupUID, String remajaUID) async {
    // TODO: LEARN TO USE RPC AND RETURNING
    try {
      await Supabase.instance.client.rpc('remove_from_uid_remaja', params: {
        'checkup_uid': checkupUID,
        'new_uid_remaja': remajaUID,
      });
    } catch (e) {
      print('error: $e');
      rethrow;
    }
  }

  @override
  Future<List<KaderCheckup>?> getCheckupList(String posyanduUID) async {
    List<PostgrestMap> response;
    try {
      response = await Supabase.instance.client
          .from('kader_checkup')
          .select()
          .eq('uid_kader', posyanduUID)
          .eq('is_finish', false);

      print('response: ${response}');
      if (response.isEmpty) {
        return null;
      }
      List<KaderCheckup> checkupList = [];
      for (var item in response) {
        KaderCheckup checkup = KaderCheckup.fromJson(item);
        checkupList.add(checkup);
      }
      return checkupList;
    } catch (e) {
      print('error: $e');
      return [];
    }
  }

  @override
  Future<List<KaderCheckup>?> getSubscribeList(
      String posyanduUID, String remajaUID) async {
    List<PostgrestMap> response;
    try {
      response = await Supabase.instance.client
          .from('kader_checkup')
          .select()
          .eq('uid_kader', posyanduUID)
          .contains('uid_remaja', [remajaUID]);

      print('response: ${response}');
      if (response.isEmpty) {
        return null;
      }
      List<KaderCheckup> checkupList = [];
      for (var item in response) {
        KaderCheckup checkup = KaderCheckup.fromJson(item);
        checkupList.add(checkup);
      }
      return checkupList;
    } catch (e) {
      print('error: $e');
      return [];
    }
  }
}
