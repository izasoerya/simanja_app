import 'package:simanja_app/domain/entities/kader_auth.dart';

abstract class KaderAuthRepo {
  Future<UserKader> getUserbyId(String id);
  Future<UserKader?> getUserbyEmail(String email);
  Future<UserKader> getUserbyPassword(String password);
  Future<List<UserKader>> getUsers();
  Future<UserKader?> updateProfilePicture(UserKader user);

  Future<void> createUser(UserKader user);
  Future<UserKader?> updateUser(UserKader user);
  Future<void> deleteUser(UserKader user);
}
