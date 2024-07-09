import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/domain/repositories/kader_auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class KaderAuthImplementation implements KaderAuthRepo {
  final Uuid _uuid = const Uuid();
  PostgrestResponse? response;

  @override
  Future<void> createUser(UserKader user) async {
    String uid = _uuid.v4();
    UserKader newUser = UserKader(
      uid: uid,
      name: user.name,
      email: user.email,
      password: user.password,
    );

    try {
      await Supabase.instance.client.from('kader_auth').insert({
        'uid': newUser.uid,
        'name': newUser.name,
        'email': newUser.email,
        'password': newUser.password,
      });
    } catch (e) {
      print('$e');
      return Future.value(e);
    }
    return Future.value();
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

  @override
  Future<UserKader> getUserbyEmail(String email) async {
    PostgrestMap response;
    try {
      response = await Supabase.instance.client
          .from('kader_auth') // select from table kader_auth
          .select() // select all columns
          .eq('email', email) // where email = email
          .single(); // fetches the first row
    } catch (e) {
      print('$e');
      return Future.error(e);
    }

    UserKader user = UserKader(
      uid: response['uid'],
      name: response['name'],
      email: response['email'],
      password: response['password'],
    );
    return user;
  }

  @override
  Future<UserKader> getUserbyPassword(String password) {
    // TODO: implement getUserbyPassword
    throw UnimplementedError();
  }

  @override
  Future<UserKader> getUserbyId(String id) async {
    // TODO: implement getUserbyId
    throw UnimplementedError();
  }
}
