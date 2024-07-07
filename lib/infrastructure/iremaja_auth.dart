import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/domain/repositories/remaja_auth_repo.dart';

class RemajaAuthImplementation implements RemajaAuthRepo {
  @override
  Future<void> createUser(UserRemaja user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(UserRemaja user) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<UserRemaja> getUserbyEmail(String email) {
    // TODO: implement getUserbyEmail
    throw UnimplementedError();
  }

  @override
  Future<UserRemaja> getUserbyId(String id) {
    // TODO: implement getUserbyId
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(UserRemaja user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
