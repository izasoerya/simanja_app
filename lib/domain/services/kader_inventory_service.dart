import 'package:simanja_app/domain/entities/kader_inventory.dart';
import 'package:simanja_app/infrastructure/ikader_inventory.dart';

class KaderInventoryService {
  Future<KaderInventory?> createInventory(KaderInventory inventory) async {
    final response =
        await KaderInventoryImplementation().createInventory(inventory);
    return response;
  }

  Future<KaderInventory?> getInventory(String idInventory) async {
    final response =
        await KaderInventoryImplementation().getInventoryById(idInventory);
    return response;
  }

  Future<List<KaderInventory>?> getListInventory(String idKader) async {
    final response =
        await KaderInventoryImplementation().getInventories(idKader);
    return response;
  }
}
