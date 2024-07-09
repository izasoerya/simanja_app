import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/infrastructure/iremaja_auth.dart';

class RemajaAuthentication {
  Future<bool> createUser(UserRemaja user) async {
    await RemajaAuthImplementation().createUser(user);
    return true;
  }
}
