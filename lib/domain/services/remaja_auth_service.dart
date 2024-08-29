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
    final fetchedUser =
        await RemajaAuthImplementation().getUserbyEmail(user.email);
    if (fetchedUser != null && fetchedUser.password == user.password) {
      return fetchedUser;
    }
    return null;
  }

  Future<UserRemaja?> getUserbyUID(String id) async {
    return await RemajaAuthImplementation().getUserbyUID(id);
  }

  Future<UserRemaja?> getUserbyEmail(String email) async {
    return await RemajaAuthImplementation().getUserbyEmail(email);
  }

  Future<List<UserRemaja>> getUsersbyPosyanduID(String posyanduUID) async {
    return await RemajaAuthImplementation().getUsersbyPosyanduID(posyanduUID);
  }

  Future<UserRemaja?> updateUser(UserRemaja user) async {
    return await RemajaAuthImplementation().updateUser(user);
  }

  Future<UserRemaja?> updatePassword(String email, String password) async {
    await getUserbyEmail(email).then((value) {
      if (value != null) {
        final remaja = value.copyWith(password: password);
        return RemajaAuthImplementation().updateUser(remaja);
      }
    });
    return null;
  }

  Future<UserRemaja?> updateProfilePicture(UserRemaja user) async {
    return await RemajaAuthImplementation().updateProfilePicture(user);
  }
}
