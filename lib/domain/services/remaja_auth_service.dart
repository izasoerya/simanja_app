import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/infrastructure/iremaja_auth.dart';

class RemajaAuthentication {
  Future<bool> createUser(UserRemaja user) async {
    var response = await RemajaAuthImplementation().createUser(user);
    if (response == null) {
      return false;
    }
    return true;
  }

  Future<UserRemaja?> loginUser(UserRemaja user) async {
    UserRemaja fetchedUser =
        await RemajaAuthImplementation().getUserbyEmail(user.email);
    if (fetchedUser.password == user.password) {
      return fetchedUser;
    }
    return null;
  }

  Future<List<UserRemaja>> getUsersbyPosyanduID(String posyanduUID) async {
    return await RemajaAuthImplementation().getUsersbyPosyanduID(posyanduUID);
  }
}
