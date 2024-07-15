import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:simanja_app/presentation/widgets/atom/item_listview.dart';

class ListViewAccount extends StatelessWidget {
  const ListViewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ItemListview(
        title: 'Ihza Surya Pratama',
        descriptions: [
          'Jl. Kebon Jeruk No. 1',
          'Kec. Kebon Jeruk',
          'Kota Jakarta Barat',
          'DKI Jakarta',
        ],
      ),
    );
  }
}
