import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_finance.dart';
import 'package:simanja_app/domain/entities/kader_inventory.dart';
import 'package:simanja_app/domain/services/kader_finance_service.dart';
import 'package:simanja_app/domain/services/kader_inventory_service.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_inventory.dart';
import 'package:simanja_app/utils/default_account.dart';
import 'package:simanja_app/utils/enums.dart';
import 'package:simanja_app/presentation/widgets/organism/image_box_management.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_kas.dart';
import 'package:simanja_app/presentation/widgets/organism/textfield_and_button.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_posyandu.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({super.key});

  @override
  State<ManagementPage> createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  ManagementObject _selectedObject = ManagementObject.kas;
  late Future<List<FinanceKader>?> _financeFuture;
  late Future<List<KaderInventory>?> _inventoryFuture;

  @override
  void initState() {
    super.initState();
    _financeFuture = KaderFinanceService().getListFinance(kaderAccount.uid);
    _inventoryFuture =
        KaderInventoryService().getListInventory(kaderAccount.uid);
  }

  void _onObjectSelected(ManagementObject object) {
    setState(() {
      _selectedObject = object;
      if (_selectedObject == ManagementObject.kas) {
        _financeFuture = KaderFinanceService().getListFinance(kaderAccount.uid);
      } else {
        _inventoryFuture =
            KaderInventoryService().getListInventory(kaderAccount.uid);
      }
    });
  }

  Future<void> _refreshFinanceList() async {
    final newFinanceList =
        await KaderFinanceService().getListFinance(kaderAccount.uid);
    setState(() => _financeFuture = Future.value(newFinanceList));
  }

  Future<void> _refreshInventoryList() async {
    final newInventoryList =
        await KaderInventoryService().getListInventory(kaderAccount.uid);
    setState(() => _inventoryFuture = Future.value(newInventoryList));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: screenHeight * 0.05)),
            const TitleWPosyandu(title: 'KELOLA POSYANDU'),
            Padding(padding: EdgeInsets.only(top: screenHeight * 0.03)),
            ImageBoxManagement(
              onTap: _onObjectSelected,
              defaultValue: _selectedObject,
            ),
            Padding(padding: EdgeInsets.only(top: screenHeight * 0.03)),
            ..._selectedObject == ManagementObject.kas
                ? [
                    FutureBuilder(
                      future: _financeFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasData) {
                          final data = snapshot.data;
                          if (data == null || data.isEmpty) {
                            return Column(
                              children: [
                                const TextfieldAndButton(finances: []),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: screenHeight * 0.03)),
                                const ListviewKas(finances: []),
                              ],
                            );
                          }
                          data.sort(
                              (a, b) => b.idIncrement.compareTo(a.idIncrement));
                          return Column(
                            children: [
                              TextfieldAndButton(
                                  finances: data,
                                  onRefresh: _refreshFinanceList),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: screenHeight * 0.03)),
                              ListviewKas(
                                finances: data,
                                onRefresh: _refreshFinanceList,
                              ),
                            ],
                          );
                        }
                        return const Text('Data tidak ditemukan');
                      },
                    ),
                  ]
                : [
                    FutureBuilder(
                        future: _inventoryFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasData) {
                            return ListviewInventory(
                                inventories: snapshot.data);
                          }
                          return const Text('Belum ada Inventori');
                        }),
                  ],
            Padding(padding: EdgeInsets.only(top: screenHeight * 0.03)),
          ],
        ),
      ),
    );
  }
}
