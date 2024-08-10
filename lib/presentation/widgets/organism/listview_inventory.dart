import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simanja_app/domain/entities/kader_inventory.dart';
import 'package:simanja_app/domain/services/kader_inventory_service.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_image.dart';
import 'package:sizer/sizer.dart';

class ListviewInventory extends StatelessWidget {
  final List<KaderInventory>? inventories;
  const ListviewInventory({super.key, this.inventories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Daftar Barang',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: GoogleFonts.archivoBlack().fontFamily,
                  fontWeight: FontWeight.normal,
                  color: const GlobalTheme().primaryColor),
              textAlign: TextAlign.start,
            ),
            IconButton(
                onPressed: () => router.push('/login-kader/create-inventory'),
                icon: const Icon(Icons.add_circle_rounded),
                iconSize: 30,
                color: const GlobalTheme().secondaryColor),
          ],
        ),
        Container(
            width: double.infinity,
            height: 2,
            color: Colors.black87,
            margin: EdgeInsets.only(bottom: 2.h, top: 0.5.h)),
        inventories != null
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.separated(
                    itemCount: inventories!.length,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemBuilder: (context, index) {
                      final image = Image.network(KaderInventoryService()
                          .getImageUrlInventory(inventories![index].uid));
                      return ItemListviewImage(
                          title: inventories![index].name,
                          uid: inventories![index].uid,
                          image: image,
                          descriptions: [
                            '${inventories![index].brand} | ${inventories![index].type} ',
                            '${inventories![index].dateReceive.toString().substring(0, 10)} | Jumlah ${inventories![index].stock}',
                          ],
                          onTap: (_) {
                            showCustomModal(context, index);
                          });
                    }),
              )
            : const Center(child: Text('Data tidak ditemukan')),
      ],
    );
  }

  Future<dynamic> showCustomModal(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (ctx) {
        return Center(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 2,
            ),
            child: AlertDialog(
              title: Text(inventories![index].name),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Merk: ${inventories![index].brand}'),
                    Text('Tipe: ${inventories![index].type}'),
                    Text('Jumlah: ${inventories![index].stock}'),
                    Text('Asal: ${inventories![index].source}'),
                    Text(
                        'Tanggal: ${inventories![index].dateReceive.toString().substring(0, 10)}'),
                    Text('Keterangan: ${inventories![index].note}'),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('Tutup'),
                ),
                TextButton(
                  onPressed: () async {
                    await KaderInventoryService()
                        .deleteInventory(inventories![index]);
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('Hapus Item',
                      style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
