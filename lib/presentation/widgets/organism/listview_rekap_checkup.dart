import 'package:intl/intl.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/services/kader_checkup_service.dart';
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
      .push('/login-kader/edit-health-remaja?checkupUID=${kaderCheckup.uid}');
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tanggal Pengecekan:\n$formattedDate',
                    style: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.bold)),
                !widget.kaderCheckup.isFinish
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green.shade500,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 2)
                            ]),
                        child: IconButton(
                            onPressed: () => showCompletionDialog(
                                context, widget.kaderCheckup),
                            icon: const Icon(Icons.check_circle_outline,
                                color: Colors.white, size: 30)),
                      )
                    : const SizedBox(),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Anemia: ${widget.items.isEmpty ? '0' : widget.items.where((e) => e?.anemia == 'Berat' || e?.anemia == 'Sedang' || e?.anemia == 'Ringan').length}',
                isFinish: true,
                onTap: (d) => widget._gotoRekapCheckupResult('Anemia'),
                uid: 'anemia'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ItemListViewNude(
                title: 'Jumlah Remaja Yang',
                description:
                    'Beresiko KEK: ${widget.items.isEmpty ? '0' : widget.items.where((e) => e?.kek == 'KEK').length}',
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

void showCompletionDialog(BuildContext context, KaderCheckup checkup) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Apakah Anda ingin menandai sebagai selesai?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Batal'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          ElevatedButton(
            child: const Text('Tandai Sebagai Selesai'),
            onPressed: () async {
              final data = checkup.copyWith(isFinish: true);
              await KaderCheckupService().updateCheckupStatus(data);
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
