import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/domain/repositories/remaja_auth_repo.dart';
import 'package:simanja_app/utils/enums.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class RemajaAuthImplementation implements RemajaAuthRepo {
  final Uuid _uuid = const Uuid();
  PostgrestResponse? response;

  @override
  Future<void> createUser(UserRemaja user) async {
    String uid = _uuid.v4();
    UserRemaja newUser = UserRemaja(
      uid: uid,
      name: user.name,
      nik: user.nik,
      sex: user.sex,
      birthDate: user.birthDate,
      address: user.address,
      bpjs: user.bpjs,
      email: user.email,
      password: user.password,
    );

    try {
      await Supabase.instance.client.from('remaja_auth').insert({
        'uid': newUser.uid,
        'name': newUser.name,
        'nik': newUser.nik,
        'is_male': newUser.sex == Gender.male ? true : false,
        'date_of_birth': newUser.birthDate?.toIso8601String(),
        'address': newUser.address,
        'is_bpjs': newUser.bpjs,
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
  Future<void> deleteUser(UserRemaja user) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<UserRemaja> getUserbyEmail(String email) async {
    PostgrestMap response;
    try {
      response = await Supabase.instance.client
          .from('remaja_auth') // select from table remaja_auth
          .select() // select all columns
          .eq('email', email) // where email = email
          .single(); // fetches the first row
    } catch (e) {
      print('$e');
      return Future.error(e);
    }

    UserRemaja user = UserRemaja(
      uid: response['uid'],
      name: response['name'],
      nik: response['nik'],
      sex: response['is_male'] == true ? Gender.male : Gender.female,
      birthDate: DateTime.parse(response['date_of_birth']),
      address: response['address'],
      bpjs: response['is_bpjs'],
      email: response['email'],
      password: response['password'],
    );
    return user;
  }

  @override
  Future<UserRemaja> getUserbyPassword(String password) {
    // TODO: implement getUserbyPassword
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
