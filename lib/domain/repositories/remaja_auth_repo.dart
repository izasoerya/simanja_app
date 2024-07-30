import 'package:simanja_app/domain/entities/remaja_auth.dart';

abstract class RemajaAuthRepo {
  Future<UserRemaja> getUserbyId(String id);
  Future<UserRemaja> getUserbyEmail(String email);
  Future<UserRemaja> getUserbyPassword(String password);
  Future<List<UserRemaja>> getUsers();

  Future<UserRemaja?> createUser(UserRemaja user);
  Future<void> updateUser(UserRemaja user);
  Future<void> deleteUser(UserRemaja user);
}
