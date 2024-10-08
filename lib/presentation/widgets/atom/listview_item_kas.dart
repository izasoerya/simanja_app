import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simanja_app/domain/entities/kader_finance.dart';
import 'package:sizer/sizer.dart';

class ItemListViewKas extends StatelessWidget {
  final FinanceKader finance;
  const ItemListViewKas({super.key, required this.finance});

  String formatToIDR(int value) {
    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 2);
    return formatter.format(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(finance.date.toString().substring(0, 10),
            style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold)),
        Text(finance.description, style: TextStyle(fontSize: 8.sp)),
        Text(
          '${finance.isDeposit ? 'Pemasukan' : 'Pengeluaran'} ${formatToIDR(int.parse(finance.value))}',
          style: TextStyle(
            fontSize: 8.sp,
            color: finance.isDeposit ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}
