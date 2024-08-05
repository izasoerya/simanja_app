import 'package:simanja_app/domain/entities/kader_event.dart';
import 'package:simanja_app/domain/repositories/kader_event_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class KaderEventImplementation implements KaderEventRepo {
  final Uuid _uuid = const Uuid();
  @override
  Future<EventKader?> createKaderEvent(EventKader kaderEvent) async {
    try {
      final newKaderEvent = kaderEvent.copyWith(id: _uuid.v4());
      final response = await Supabase.instance.client
          .from('kader_activity')
          .insert(newKaderEvent.toJSON())
          .select()
          .single();
      final parsedResponse = EventKader.fromJSON(response);
      if (parsedResponse.id == newKaderEvent.id) {
        return EventKader.fromJSON(response);
      }
      return null;
    } catch (e) {
      print('e: $e');
      return null;
    }
  }

  @override
  Future<void> deleteKaderEvent(EventKader kaderEvent) {
    // TODO: implement deleteKaderEvent
    throw UnimplementedError();
  }

  @override
  Future<EventKader> getKaderEventById(String id) {
    // TODO: implement getKaderEventById
    throw UnimplementedError();
  }

  @override
  Future<List<EventKader>> getKaderEvents(String idKader) async {
    try {
      final response = await Supabase.instance.client
          .from('kader_activity')
          .select()
          .eq('uid_kader', idKader);
      if (response.isNotEmpty) {
        return response.map((e) => EventKader.fromJSON(e)).toList();
      }
      return [];
    } catch (e) {
      print('e: $e');
      return [];
    }
  }

  @override
  Future<void> updateKaderEvent(EventKader kaderEvent) {
    // TODO: implement updateKaderEvent
    throw UnimplementedError();
  }
}
