import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/infrastructure/ikader_auth.dart';

class KaderAuthentication {
  Future<bool> createUser(UserKader user) async {
    await KaderAuthImplementation().createUser(user);
    return true;
  }

  Future<UserKader> loginUser(UserKader user) async {
    final kader = await KaderAuthImplementation().getUserbyEmail(user.email);
    if (kader != null && kader.password == user.password) {
      return kader;
    }
    print('There is no user with that email or password');
    return user.copyWith(uid: 'dummy'); // return invalid account
  }

  Future<List<Map<String, String>>> getPosyanduList() async {
    final response = await KaderAuthImplementation().getUsers();
    return response
        .map((e) => {'uid': e.uid, 'posyandu': e.namePosyandu})
        .toList();
  }

  Future<void> debugUsers() async {
    var data = await KaderAuthImplementation().getUsers();
    for (var user in data) {
      print(user.toString());
    }
  }
}
