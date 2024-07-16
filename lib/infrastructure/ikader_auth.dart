import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/domain/repositories/kader_auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class KaderAuthImplementation implements KaderAuthRepo {
  final Uuid _uuid = const Uuid();

  @override
  Future<void> createUser(UserKader user) async {
    String uid = _uuid.v4();
    UserKader newUser = UserKader(
      uid: uid,
      nameAccount: user.nameAccount,
      namePosyandu: user.namePosyandu,
      keyPosyandu: user.keyPosyandu,
      birthDate: user.birthDate,
      address: user.address,
      email: user.email,
      password: user.password,
    );

    try {
      await Supabase.instance.client.from('kader_auth').insert({
        'uid': newUser.uid,
        'account_name': newUser.nameAccount,
        'posyandu_name': newUser.namePosyandu,
        'posyandu_key': newUser.keyPosyandu,
        'date_of_birth': newUser.birthDate.toIso8601String(),
        'address': newUser.address,
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
      nameAccount: response['account_name'],
      namePosyandu: response['posyandu_name'],
      keyPosyandu: response['posyandu_key'],
      birthDate: DateTime.parse(response['date_of_birth']),
      address: response['address'],
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

  @override
  Future<List<UserKader>> getUsers() async {
    List<PostgrestMap> response;
    try {
      response = await Supabase.instance.client
          .from('kader_auth') // select from table kader_auth
          .select(); // select all columns
    } catch (e) {
      return Future.error(e);
    }

    List<UserKader> users = [];
    for (PostgrestMap user in response) {
      users.add(UserKader(
        uid: user['uid'],
        nameAccount: user['kader_name'],
        namePosyandu: user['posyandu_name'],
        keyPosyandu: user['nik'],
        birthDate: DateTime.parse(user['date_of_birth']),
        address: user['address'],
        email: user['email'],
        password: user['password'],
      ));
    }
    return users;
  }
}
