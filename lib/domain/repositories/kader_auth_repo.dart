import 'package:simanja_app/domain/entities/kader_auth.dart';

abstract class KaderAuthRepo {
  Future<UserKader> getUserbyId(String id);
  Future<UserKader> getUserbyEmail(String email);

  Future<void> createUser(UserKader user);
  Future<void> updateUser(UserKader user);
  Future<void> deleteUser(UserKader user);
}
