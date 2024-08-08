import 'package:flutter/material.dart';

class ItemListViewKas extends StatelessWidget {
  const ItemListViewKas({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('27/6/2023 | Kalurahan', style: TextStyle(fontSize: 12)),
        Text('27/6/2023 | Bangunharjo', style: TextStyle(fontSize: 12)),
        Text('27/6/2023 | Kecamatan', style: TextStyle(fontSize: 12)),
        Text('27/6/2023 | Seturan', style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
