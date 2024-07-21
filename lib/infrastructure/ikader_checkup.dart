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
        KaderCheckup(uid: uid, checkupTitle: title, date: date);
    try {
      final response =
          await Supabase.instance.client.from('kader_checkup').insert({
        'uid': checkup.uid,
        'uid_kader': kaderUID,
        'event_name': checkup.checkupTitle,
        'date': checkup.date.toIso8601String(),
      }).select();
      if (response[0]['uid'] == checkup.uid) {
        return KaderCheckup(
            uid: response[0]['uid'],
            checkupTitle: response[0]['event_name'],
            date: DateTime.parse(response[0]['date']));
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
  Future<List<KaderCheckup>> getCheckupList() {
    // TODO: implement getCheckupList
    throw UnimplementedError();
  }

  @override
  Future<KaderCheckup> getCheckupbyDate(DateTime date) {
    // TODO: implement getCheckupbyDate
    throw UnimplementedError();
  }

  @override
  Future<void> updateCheckup(KaderCheckup activity) {
    // TODO: implement updateCheckup
    throw UnimplementedError();
  }
}