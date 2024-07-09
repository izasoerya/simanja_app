import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/infrastructure/ikader_auth.dart';

class KaderAuthentication {
  Future<bool> createUser(UserKader user) async {
    await KaderAuthImplementation().createUser(user);
    return true;
  }

  Future<bool> loginUser(UserKader user) async {
    try {
      UserKader fetchedUser =
          await KaderAuthImplementation().getUserbyEmail(user.email!);
      if (fetchedUser.password == user.password) {
        return true;
      }
    } catch (e) {
      print('Error logging in user: $e');
    }
    return false;
  }
}
