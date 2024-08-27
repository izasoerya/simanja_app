import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/utils/date_formatter.dart';

class ItemListViewActivity extends StatelessWidget {
  final String title;
  final List<String> description;
  final DateTime date;
  final Image? image;
  const ItemListViewActivity({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const GlobalTheme().primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 60,
              child: image ?? Image.asset('assets/logo/No_Image.jpg')),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const GlobalTheme().secondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description.join('\n'),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  overflow: TextOverflow.visible,
                ),
                const SizedBox(height: 10),
                Text(
                  '${DateFormatter().convertToIndonesian(date)} | 12.30 - Selesai',
                  style: TextStyle(
                      color: const GlobalTheme().lightSecondaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
