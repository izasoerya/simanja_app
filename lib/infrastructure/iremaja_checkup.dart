import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/repositories/remaja_checkup_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemajaCheckupImplementation implements RemajaCheckupRepo {
  @override
  Future<List<String>?> subscribeCheckup(
      String checkupUID, String remajaUID) async {
    List<PostgrestMap> response;
    print('checkupUID: $checkupUID');
    print('remajaID: $remajaUID');
    try {
      response = await Supabase.instance.client
          .from('kader_checkup')
          .update({
            'uid_remaja': [remajaUID],
          })
          .eq('uid', checkupUID)
          .select();
    } catch (e) {
      print('error: $e');
      return null;
    }
    if (response.isNotEmpty) {
      List<dynamic> remajaIdList = response[0]['uid_remaja'];
      return remajaIdList.map((id) => id.toString()).toList();
    }
    print('response: $response');
    return null;
  }

  @override
  Future<KaderCheckup?> deleteCheckup(String checkupUID, String remajaUID) {
    // TODO: implement deleteCheckup
    throw UnimplementedError();
  }

  @override
  Future<List<KaderCheckup>> getCheckupList(String uid) {
    // TODO: implement getCheckupList
    throw UnimplementedError();
  }
}
