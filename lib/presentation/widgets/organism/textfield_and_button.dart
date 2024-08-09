import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_finance.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class TextfieldAndButton extends StatefulWidget {
  final void Function()? onRefresh;
  final List<FinanceKader> finances;
  const TextfieldAndButton({super.key, required this.finances, this.onRefresh});

  @override
  State<TextfieldAndButton> createState() => _TextfieldAndButtonState();
}

class _TextfieldAndButtonState extends State<TextfieldAndButton> {
  int _total = 0;
  String formatToIDR(int value) {
    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 2);
    return formatter.format(value);
  }

  @override
  Widget build(BuildContext context) {
    for (var e in widget.finances) {
      if (e.isDeposit) {
        _total += int.parse(e.value);
      } else {
        _total -= int.parse(e.value);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Kas Posyandu',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const GlobalTheme().primaryColor)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Text('Saldo',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const GlobalTheme().secondaryColor,
                      )),
                  Text(formatToIDR(int.parse(_total.toString())),
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: const GlobalTheme().primaryColor)),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  router.push('/login-kader/create-mutation');
                  widget.onRefresh!();
                },
                icon: const Icon(Icons.add_circle_rounded),
                iconSize: MediaQuery.of(context).size.width * 0.15,
                color: const GlobalTheme().secondaryColor),
          ],
        )
      ],
    );
  }
}
