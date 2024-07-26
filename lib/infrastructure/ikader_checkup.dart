import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/repositories/kader_checkup_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class KaderCheckupImplementation implements KaderCheckupRepo {
  final Uuid _uuid = const Uuid();
  @override
  Future<KaderCheckup?> createCheckup(
      String title, DateTime date, String kaderUID) async {
    String uid = _uuid.v4();
    KaderCheckup checkup =
        KaderCheckup(uid: uid, checkupTitle: title, dateEvent: date);
    try {
      final response =
          await Supabase.instance.client.from('kader_checkup').insert({
        'uid': checkup.uid,
        'uid_kader': kaderUID,
        'event_name': checkup.checkupTitle,
        'date': checkup.dateEvent.toIso8601String(),
      }).select();
      if (response[0]['uid'] == checkup.uid) {
        return KaderCheckup(
            uid: response[0]['uid'],
            checkupTitle: response[0]['event_name'],
            dateEvent: DateTime.parse(response[0]['date']));
      }
      return null; // else return error
    } catch (e) {
      print('$e');
      return null;
    }
  }

  @override
  Future<void> deleteCheckup(KaderCheckup activity) {
    // TODO: implement deleteCheckup
    throw UnimplementedError();
  }

  @override
  Future<List<KaderCheckup>> getCheckups(String uid) async {
    // TODO: implement getCheckupList
    List<PostgrestMap> response;
    try {
      response = await Supabase.instance.client
          .from('kader_checkup') // select from table kader_checkup
          .select('*') // select all columns
          .eq('uid_kader', uid); // where uid_kader = uid
    } catch (e) {
      return Future.error(e);
    }

    List<KaderCheckup> checkups = [];
    for (PostgrestMap user in response) {
      checkups.add(KaderCheckup(
        uid: user['uid'],
        checkupTitle: user['event_name'],
        dateEvent: DateTime.parse(user['date']),
      ));
    }
    return checkups;
  }

  @override
  Future<KaderCheckup> getCheckupbyDate(DateTime date) {
    // TODO: implement getCheckupbyDate
    throw UnimplementedError();
  }

  @override
  Future<KaderCheckup?> updateCheckup(KaderCheckup checkup) async {
    PostgrestMap response;
    try {
      response = await Supabase.instance.client
          .from('kader_checkup')
          .update({
            'event_name': checkup.checkupTitle,
            'is_finish': checkup.isFinish, // Update is_finish to true
          })
          .eq('uid', checkup.uid)
          .select()
          .single();
    } catch (e) {
      print('$e');
      return null;
    }
    return KaderCheckup(
      uid: response['uid'],
      checkupTitle: response['event_name'],
      dateEvent: DateTime.parse(response['date']),
    );
  }
}
