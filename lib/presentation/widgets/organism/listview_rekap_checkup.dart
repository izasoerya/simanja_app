import 'package:intl/intl.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/utils/util_excel.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_nude.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';

class ListViewRekapCheckup extends StatefulWidget {
  final List<HealthPropertiesRemaja?> items;
  final KaderCheckup kaderCheckup;
  const ListViewRekapCheckup({
    super.key,
    required this.items,
    required this.kaderCheckup,
  });

  void _gotoAddCheckupData() => router
      .push('/login-kader/list-remaja-checkup?checkupUID=${kaderCheckup.uid}');
  void _gotoRekapCheckupResult(String label) => router.push(
      '/login-kader/rekap-checkup-result?checkupUID=${kaderCheckup.uid}&label=$label');

  @override
  State<ListViewRekapCheckup> createState() => _ListViewRekapCheckupState();
}

class _ListViewRekapCheckupState extends State<ListViewRekapCheckup> {
  bool _isLocaleInitialized = false;
  String get formattedDate {
    return DateFormat('d MMMM y', 'id').format(widget.kaderCheckup.dateEvent);
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
                onTap: (d) => widget._gotoRekapCheckupResult('Anemia'),
                uid: 'anemia'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Beresiko KEK: ${widget.items.isEmpty ? '0' : widget.items.where((element) => element?.kek ?? false).length}',
                isFinish: true,
                onTap: (d) => widget._gotoRekapCheckupResult('Beresiko KEK'),
                uid: 'kek'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Obesitas: ${widget.items.isEmpty ? '0' : widget.items.where((element) => element?.imt != null && element!.imt! > 27.0).length}',
                isFinish: true,
                onTap: (d) => widget._gotoRekapCheckupResult('Obesitas'),
                uid: 'obesitas'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Sangat Kurus: ${widget.items.isEmpty ? '0' : widget.items.where((element) => element?.imt != null && element!.imt! < 17.0).length}',
                isFinish: true,
                onTap: (d) => widget._gotoRekapCheckupResult('Sangat Kurus'),
                uid: 'kurus'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Merokok: ${widget.items.isEmpty ? '0' : widget.items.where((element) => element?.smoker ?? false).length}',
                isFinish: true,
                onTap: (d) => widget._gotoRekapCheckupResult('Merokok'),
                uid: 'merokok'),
            const Padding(padding: EdgeInsets.only(top: 40)),
            !widget.kaderCheckup.isFinish
                ? SubmitButton(
                    text: 'Tambah Data Checkup',
                    onClick: widget._gotoAddCheckupData)
                : const SizedBox(),
            const Padding(padding: EdgeInsets.only(top: 15)),
            SubmitButton(
                text: 'Lihat List Checkup Remaja',
                backgroundColor: const GlobalTheme().primaryColor,
                onClick: () {
                  router.push(
                      '/login-kader/rekap-checkup-result?checkupUID=${widget.kaderCheckup.uid}&label=all');
                }),
            const Padding(padding: EdgeInsets.only(top: 15)),
            SubmitButton(
                text: 'Unduh Excel',
                backgroundColor: const Color.fromRGBO(16, 121, 63, 1),
                icon:
                    const Icon(Icons.table_chart_outlined, color: Colors.white),
                onClick: () async {
                  if (widget.items.isEmpty) {
                    return;
                  }
                  final response = await UtilExcel().createExcel(widget.items);
                  if (response != null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Berhasil membuat excel')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Gagal membuat excel')));
                  }
                }),
            const Padding(padding: EdgeInsets.only(top: 50)),
          ],
        ));
  }
}
