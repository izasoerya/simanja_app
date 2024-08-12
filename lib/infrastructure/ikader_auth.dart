import 'dart:io';

import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/domain/repositories/kader_auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class KaderAuthImplementation implements KaderAuthRepo {
  final Uuid _uuid = const Uuid();

  @override
  Future<void> createUser(UserKader user) async {
    String uid = _uuid.v4();
    UserKader newUser = user.copyWith(uid: uid);

    try {
      await Supabase.instance.client
          .from('kader_auth')
          .insert(newUser.toJSON());
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
  Future<UserKader?> getUserbyEmail(String email) async {
    try {
      final response = await Supabase.instance.client
          .from('kader_auth') // select from table kader_auth
          .select() // select all columns
          .eq('email', email) // where email = email
          .single(); // fetches the first row
      return UserKader.fromJSON(response);
    } catch (e) {
      print('$e');
      return null;
    }
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
    try {
      final response = await Supabase.instance.client
          .from('kader_auth') // select from table kader_auth
          .select(); // select all columns
      return response.map((e) => UserKader.fromJSON(e)).toList();
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<UserKader?> updateProfilePicture(UserKader user) async {
    final avatarFile = File(user.urlImage!);
    try {
      final fileName = '${user.uid}.jpg';
      print('uid kader: ${user.uid}');
      final files =
          await Supabase.instance.client.storage.from('avatar_image').list();
      final fileExists = files.any((file) => file.name == fileName);

      if (fileExists) {
        await Supabase.instance.client.storage.from('avatar_image').update(
              fileName,
              avatarFile,
              fileOptions: const FileOptions(cacheControl: '3600'),
            );
      } else {
        await Supabase.instance.client.storage.from('avatar_image').upload(
            fileName, avatarFile,
            fileOptions:
                const FileOptions(cacheControl: '3600', upsert: false));
      }

      final getPublicUrl = Supabase.instance.client.storage
          .from('avatar_image')
          .getPublicUrl(fileName);
      final response = await Supabase.instance.client
          .from('kader_auth')
          .update({'url_image': getPublicUrl})
          .eq('uid', user.uid)
          .select()
          .single();
      return UserKader.fromJSON(response);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
