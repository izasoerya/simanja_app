import 'package:simanja_app/domain/entities/kader_menu.dart';

abstract class KaderMenuRepo {
  Future<List<MenuKader>> getMenus();
  Future<MenuKader> getMenuById(String id);

  Future<void> createMenu(MenuKader menu);
  Future<void> updateMenu(MenuKader menu);
  Future<void> deleteMenu(MenuKader menu);
}
