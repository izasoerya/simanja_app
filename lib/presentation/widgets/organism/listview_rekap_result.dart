import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/presentation/widgets/atom/listview_item_health.dart';
import 'package:sizer/sizer.dart';

class RekapResultList extends StatefulWidget {
  final List<HealthPropertiesRemaja?> healths;
  final String label;
  const RekapResultList({
    super.key,
    required this.healths,
    required this.label,
  });

  @override
  _RekapResultListState createState() => _RekapResultListState();
}

class _RekapResultListState extends State<RekapResultList> {
  String _selectedSortOption = 'Terbaru';

  @override
  Widget build(BuildContext context) {
    List<HealthPropertiesRemaja?> sortedHealths = List.from(widget.healths);
    if (_selectedSortOption == 'Terbaru') {
      sortedHealths.sort((a, b) => b!.checkedAt!.compareTo(a!.checkedAt!));
    } else {
      sortedHealths.sort((a, b) => a!.checkedAt!.compareTo(b!.checkedAt!));
    }

    return SizedBox(
      height: 50.h,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DropdownButton<String>(
              value: _selectedSortOption,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedSortOption = newValue;
                  });
                }
              },
              underline: const SizedBox(),
              items: <String>['Terbaru', 'Terlama']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: sortedHealths.length,
              separatorBuilder: (context, index) =>
                  const Divider(height: 10, color: Colors.white),
              itemBuilder: (context, index) {
                return ItemListViewHealth(
                    health: sortedHealths[index]!, label: widget.label);
              },
            ),
          ],
        ),
      ),
    );
  }
}
