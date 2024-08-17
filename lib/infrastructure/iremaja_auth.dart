import 'dart:async';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/domain/repositories/remaja_auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class RemajaAuthImplementation implements RemajaAuthRepo {
  final Uuid _uuid = const Uuid();

  @override
  Future<UserRemaja?> createUser(UserRemaja user) async {
    String uid = _uuid.v4();
    UserRemaja newUser = user.copyWith(uid: uid);

    try {
      await Supabase.instance.client
          .from('remaja_auth')
          .insert(newUser.toJSON());

      final response = await Supabase.instance.client
          .from('remaja_auth')
          .select()
          .eq('uid', newUser.uid)
          .single();
      return response.containsValue(newUser.uid) ? newUser : null;
    } catch (e) {
      print('$e');
      return null;
    }
  }

  @override
  Future<void> deleteUser(UserRemaja user) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<UserRemaja?> updateUser(UserRemaja user) async {
    try {
      final response = await Supabase.instance.client
          .from('remaja_auth')
          .update(user.toJSON())
          .eq('uid', user.uid)
          .select()
          .single();
      return UserRemaja.fromJSON(response);
    } on Exception catch (e) {
      print('Error: $e');
      return null;
    }
  }

  @override
  Future<UserRemaja?> getUserbyEmail(String email) async {
    PostgrestMap response;
    try {
      response = await Supabase.instance.client
          .from('remaja_auth') // select from table remaja_auth
          .select() // select all columns
          .eq('email', email) // where email = email
          .single(); // fetches the first row
    } catch (e) {
      print('$e');
      return null;
    }

    UserRemaja fetchedUser = UserRemaja.fromJSON(response);
    return fetchedUser;
  }

  @override
  Future<UserRemaja> getUserbyPassword(String password) {
    // TODO: implement getUserbyPassword
    throw UnimplementedError();
  }

  @override
  Future<UserRemaja?> getUserbyUID(String remajaUID) async {
    try {
      final response = await Supabase.instance.client
          .from('remaja_auth')
          .select()
          .eq('uid', remajaUID)
          .single();
      return UserRemaja.fromJSON(response);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  @override
  Future<List<UserRemaja>> getUsersbyPosyanduID(String posyanduUID) async {
    List<PostgrestMap> responses;
    try {
      responses = await Supabase.instance.client
          .from('remaja_auth')
          .select('*')
          .eq('posyandu', posyanduUID);
    } catch (e) {
      print('Error: $e');
      return Future.error(e);
    }
    return responses.map((response) => UserRemaja.fromJSON(response)).toList();
  }

  @override
  Future<List<UserRemaja>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }
}
