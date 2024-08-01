import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_nude.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';

class ListViewRekapCheckup extends StatefulWidget {
  final List<HealthPropertiesRemaja?> items;
  final DateTime checkupDate;
  final bool isFinish;
  const ListViewRekapCheckup({
    super.key,
    required this.items,
    required this.checkupDate,
    this.isFinish = false,
  });

  @override
  State<ListViewRekapCheckup> createState() => _ListViewRekapCheckupState();
}

class _ListViewRekapCheckupState extends State<ListViewRekapCheckup> {
  bool _isLocaleInitialized = false;
  String get formattedDate {
    return DateFormat('d MMMM y', 'id').format(widget.checkupDate);
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id', null).then((_) {
      setState(() {
        _isLocaleInitialized = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLocaleInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tanggal Pengecekan: $formattedDate',
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold)),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Anemia: ${widget.items.isEmpty ? '0' : widget.items.where((element) => element?.anemia ?? false).length}',
                isFinish: true,
                uid: 'anemia'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Beresiko KEK: ${widget.items.isEmpty ? '0' : widget.items.where((element) => element?.kek ?? false).length}',
                isFinish: true,
                uid: 'kek'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Obesitas: ${widget.items.isEmpty ? '0' : widget.items.where((element) => (element?.weight ?? 0) > 10).length}',
                isFinish: true,
                uid: 'obesitas'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Sangat Kurus: ${widget.items.isEmpty ? '0' : widget.items.where((element) => (element?.weight ?? 0) < 10).length}',
                isFinish: true,
                uid: 'kurus'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Merokok: ${widget.items.isEmpty ? '0' : widget.items.where((element) => element?.smoker ?? false).length}',
                isFinish: true,
                uid: 'merokok'),
            const Padding(padding: EdgeInsets.only(top: 40)),
            !widget.isFinish
                ? SubmitButton(text: 'Tambah Data Checkup', onClick: () {})
                : const SizedBox(),
          ],
        ));
  }
}
