import 'package:simanja_app/domain/entities/kader_inventory.dart';

abstract class KaderInventoryRepo {
  Future<List<KaderInventory>?> getInventories(String uidPosyandu);
  Future<KaderInventory?> getInventoryById(String id);

  Future<KaderInventory?> createInventory(KaderInventory inventory);
  Future<KaderInventory?> updateInventory(KaderInventory inventory);
  Future<void> deleteInventory(KaderInventory inventory);
  String getImageUrlInventory(String path);
}
