import 'package:supabase_flutter/supabase_flutter.dart';

class RemajaCheckupService {
  Future<List<String>?> subscribeCheckup(
      String checkupUID, String remajaID) async {
    List<PostgrestMap> response;
    print('checkupUID: $checkupUID');
    print('remajaID: $remajaID');
    try {
      response = await Supabase.instance.client
          .from('kader_checkup')
          .update({
            'uid_remaja': [remajaID],
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
}
