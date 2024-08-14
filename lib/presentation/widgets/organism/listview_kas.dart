import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_finance.dart';
import 'package:simanja_app/domain/services/kader_finance_service.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_snackbar.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_kas.dart';
import 'package:sizer/sizer.dart';

class ListviewKas extends StatelessWidget {
  final void Function()? onRefresh;
  final List<FinanceKader> finances;
  const ListviewKas({super.key, required this.finances, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Detail Mutasi Kas',
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
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
                        onPressed: () async {
                          await KaderFinanceService()
                              .deleteFinance(finances[index]);
                          showCustomSnackbar(context, 'Berhasil Menghapus', 0);
                          onRefresh!();
                        },
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
