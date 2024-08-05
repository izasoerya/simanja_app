import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/domain/repositories/remaja_event_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemajaEventImplementation implements RemajaEventRepo {
  @override
  Future<void> subscribeCheckup(String eventUID, String remajaUID) async {
    // TODO: LEARN TO USE RPC AND RETURNING
    try {
      await Supabase.instance.client.rpc('append_to_uid_remaja_event', params: {
        'checkup_uid': eventUID,
        'new_uid_remaja': remajaUID,
      });
    } catch (e) {
      print('error: $e');
      rethrow;
    }
  }

  @override
  Future<void> unsubscribeCheckup(String eventUID, String remajaUID) async {
    // TODO: LEARN TO USE RPC AND RETURNING
    try {
      await Supabase.instance.client
          .rpc('remove_from_uid_remaja_event', params: {
        'checkup_uid': eventUID,
        'new_uid_remaja': remajaUID,
      });
    } catch (e) {
      print('error: $e');
      rethrow;
    }
  }

  @override
  Future<List<EventKader>?> getEventList(String posyanduUID) {
    // TODO: implement getEventList
    throw UnimplementedError();
  }

  @override
  Future<List<EventKader>?> getSubscribeList(
      String posyanduUID, String remajaUID) async {
    try {
      final response = await Supabase.instance.client
          .from('kader_activity')
          .select()
          .contains('uid_remaja', [remajaUID]).eq('uid_kader', posyanduUID);
      List<EventKader> eventList = [];
      if (response.isNotEmpty) {
        for (var item in response) {
          eventList.add(EventKader.fromJSON(item));
        }
        return eventList;
      }
      return [];
    } catch (e) {
      print('error: $e');
      rethrow;
    }
  }
}
