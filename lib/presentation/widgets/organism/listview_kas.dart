import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simanja_app/domain/entities/kader_finance.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_kas.dart';
import 'package:sizer/sizer.dart';

class ListviewKas extends StatelessWidget {
  final List<FinanceKader> finances;
  const ListviewKas({super.key, required this.finances});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Detail Mutasi Kas',
            style: TextStyle(
                fontSize: 15.sp,
                fontFamily: GoogleFonts.archivoBlack().fontFamily,
                fontWeight: FontWeight.normal,
                color: const GlobalTheme().primaryColor)),
        Container(
            width: double.infinity,
            height: 2,
            color: Colors.black87,
            margin: EdgeInsets.only(bottom: 2.h, top: 0.5.h)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView.separated(
              itemCount: finances.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemListViewKas(finance: finances[index]),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_rounded),
                        iconSize: MediaQuery.of(context).size.width * 0.08,
                        color: Colors.grey),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
