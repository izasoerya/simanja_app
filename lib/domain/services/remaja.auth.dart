import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/infrastructure/iremaja_auth.dart';

class RemajaAuthentication {
  Future<bool> createUser(UserRemaja user) async {
    await RemajaAuthImplementation().createUser(user);
    return true;
  }

  Future<bool> loginUser(UserRemaja user) async {
    try {
      UserRemaja fetchedUser =
          await RemajaAuthImplementation().getUserbyEmail(user.email!);
      if (fetchedUser.password == user.password) {
        return true;
      }
    } catch (e) {
      print('Error logging in user: $e');
    }
    return false;
  }
}
