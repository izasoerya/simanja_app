import 'dart:io';

import 'package:simanja_app/domain/entities/kader_inventory.dart';
import 'package:simanja_app/domain/repositories/kader_inventory_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class KaderInventoryImplementation implements KaderInventoryRepo {
  final Uuid _uuid = const Uuid();
  @override
  Future<KaderInventory?> createInventory(KaderInventory inventory) async {
    final data = inventory.copyWith(uid: _uuid.v4());
    final avatarFile = File(data.imageURL);
    try {
      final response = await Supabase.instance.client
          .from('kader_inventory')
          .insert(data.toJSON())
          .select()
          .single();
      await Supabase.instance.client.storage.from('avatar_image').upload(
            'kader/${data.uid}.jpg',
            avatarFile,
            fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
          );
      return KaderInventory.fromJson(response);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  @override
  Future<List<KaderInventory>?> getInventories(String uidPosyandu) async {
    try {
      final response = await Supabase.instance.client
          .from('kader_inventory')
          .select()
          .eq('uid_posyandu', uidPosyandu);
      return response.map((e) => KaderInventory.fromJson(e)).toList();
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  @override
  Future<KaderInventory?> getInventoryById(String id) async {
    try {
      final response = await Supabase.instance.client
          .from('kader_inventory')
          .select()
          .eq('uid', id)
          .single();
      return KaderInventory.fromJson(response);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  @override
  Future<KaderInventory?> updateInventory(KaderInventory inventory) {
    // TODO: implement updateInventory
    throw UnimplementedError();
  }

  @override
  Future<void> deleteInventory(KaderInventory inventory) async {
    try {
      await Supabase.instance.client
          .from('kader_inventory')
          .delete()
          .eq('uid', inventory.uid);
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  String getImageUrlInventory(String path) {
    final response = Supabase.instance.client.storage
        .from('avatar_image')
        .getPublicUrl('kader/$path.jpg');
    return response;
  }
}
