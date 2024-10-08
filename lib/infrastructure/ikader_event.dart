import 'dart:io';

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
  Future<EventKader?> getKaderEventById(String id) async {
    try {
      final response = await Supabase.instance.client
          .from('kader_activity')
          .select()
          .eq('uid', id)
          .single();
      return EventKader.fromJSON(response);
    } catch (e) {
      print('e: $e');
      return null;
    }
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
  Future<EventKader?> updateKaderEvent(EventKader kaderEvent) async {
    final response = await Supabase.instance.client
        .from('kader_activity')
        .update(kaderEvent.toJSON())
        .eq('uid', kaderEvent.id)
        .select('*')
        .single();
    return EventKader.fromJSON(response);
  }

  @override
  Future<EventKader?> updateProfilePicture(EventKader kaderEvent) async {
    final avatarFile = File(kaderEvent.urlImage!);
    try {
      await Supabase.instance.client.storage.from('avatar_image').upload(
            'activity/${kaderEvent.id}.jpg',
            avatarFile,
            fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
          );
      final getPublicUrl = Supabase.instance.client.storage
          .from('avatar_image')
          .getPublicUrl('activity/${kaderEvent.id}.jpg');
      kaderEvent = kaderEvent.copyWith(urlImage: getPublicUrl);
      final response = await Supabase.instance.client
          .from('kader_activity')
          .update(kaderEvent.toJSON())
          .eq('uid', kaderEvent.id)
          .select('*')
          .single();
      return EventKader.fromJSON(response);
    } catch (e) {
      print('e: $e');
      return null;
    }
  }

  @override
  Future<Error?> deleteKaderEvent(EventKader kaderEvent) async {
    try {
      await Supabase.instance.client
          .from('kader_activity')
          .delete()
          .eq('uid', kaderEvent.id);
      return null;
    } catch (e) {
      print('Error: $e');
      return Error.throwWithStackTrace(e, StackTrace.current);
    }
  }
}
