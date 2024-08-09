import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class TextfieldAndButton extends StatelessWidget {
  final String value;
  const TextfieldAndButton({super.key, this.value = '0,00'});

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
                  Text(formatToIDR(int.parse(value)),
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: const GlobalTheme().primaryColor)),
                ],
              ),
            ),
            IconButton(
                onPressed: () => router.push('/login-kader/create-mutation'),
                icon: const Icon(Icons.add_circle_rounded),
                iconSize: MediaQuery.of(context).size.width * 0.15,
                color: const GlobalTheme().secondaryColor),
          ],
        )
      ],
    );
  }
}
