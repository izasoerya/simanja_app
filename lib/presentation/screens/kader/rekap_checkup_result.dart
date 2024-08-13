import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/domain/services/remaja_heath_service.dart';
import 'package:simanja_app/presentation/widgets/organism/listview_rekap_result.dart';
import 'package:simanja_app/presentation/widgets/template/title_w_description.dart';

class RekapCheckupResultPage extends StatefulWidget {
  final String checkupUID;
  final String label;
  const RekapCheckupResultPage(
      {super.key, required this.checkupUID, required this.label});

  @override
  State<RekapCheckupResultPage> createState() => _RekapCheckupResultPageState();
}

class _RekapCheckupResultPageState extends State<RekapCheckupResultPage> {
  List<HealthPropertiesRemaja?> data = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchFuture();
  }

  void _fetchFuture() async {
    data =
        (await RemajaHealthService().getListCheckupHealth(widget.checkupUID))!;
    setState(() {
      isLoading = false;
    });
  }

  List<HealthPropertiesRemaja?> _filterHealthsByLabel(
      String label, List<HealthPropertiesRemaja?> data) {
    switch (label) {
      case 'Anemia':
        return data.where((e) => e != null && e.anemia == true).toList();
      case 'Beresiko KEK':
        return data.where((e) => e != null && e.kek == true).toList();
      case 'Obesitas':
        return data
            .where((e) => e != null && e.imt != null && e.imt! > 27.0)
            .toList();
      case 'Sangat Kurus':
        return data
            .where((e) => e != null && e.imt != null && e.imt! < 17.0)
            .toList();
      case 'Merokok':
        return data.where((e) => e != null && e.smoker == true).toList();
      case 'all':
        return data;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<HealthPropertiesRemaja?> filteredData =
        data.isNotEmpty ? _filterHealthsByLabel(widget.label, data) : [];
    print(filteredData);

    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 30)),
            TitleWDescription(
                title: 'Rekap Remaja ${widget.label}',
                description: 'Daftar remaja dengan ${widget.label}'),
            const Padding(padding: EdgeInsets.only(top: 30)),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : (filteredData.isEmpty || data.isEmpty)
                    ? const Text('Data tidak ditemukan')
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: RekapResultList(
                            healths: filteredData, label: widget.label),
                      ),
          ],
        ),
      ),
    );
  }
}
