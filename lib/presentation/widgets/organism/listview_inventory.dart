import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simanja_app/domain/entities/kader_inventory.dart';
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
                      return ItemListviewImage(
                          title: inventories![index].name,
                          uid: inventories![index].uid,
                          descriptions: [
                            '${inventories![index].brand} | ${inventories![index].type} ',
                            '${inventories![index].dateReceive.toString().substring(0, 10)} | Jumlah ${inventories![index].stock}',
                          ],
                          onTap: (_) {});
                    }),
              )
            : const Center(child: Text('Data tidak ditemukan')),
      ],
    );
  }
}
