import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/domain/repositories/kader_auth_repo.dart';

class KaderAuthImplementation implements KaderAuthRepo {
  @override
  Future<UserKader> getUserbyId(String id) async {
    // TODO: implement getUserbyId
    throw UnimplementedError();
  }

  @override
  Future<UserKader> getUserbyEmail(String email) {
    // TODO: implement getUserbyEmail
    throw UnimplementedError();
  }

  @override
  Future<void> createUser(UserKader user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(UserKader user) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(UserKader user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
