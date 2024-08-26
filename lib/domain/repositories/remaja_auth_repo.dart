import 'package:simanja_app/domain/entities/remaja_auth.dart';

abstract class RemajaAuthRepo {
  Future<UserRemaja?> getUserbyUID(String id);
  Future<UserRemaja?> getUserbyEmail(String email);
  Future<UserRemaja> getUserbyPassword(String password);
  Future<List<UserRemaja>> getUsersbyPosyanduID(String posyanduUID);
  Future<List<UserRemaja>> getAllUsers();

  Future<UserRemaja?> createUser(UserRemaja user);
  Future<UserRemaja?> updateUser(UserRemaja user);
  Future<UserRemaja?> updateProfilePicture(UserRemaja user);
  Future<void> deleteUser(UserRemaja user);
}
