import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class ItemListViewNude extends StatelessWidget {
  final String uid;
  final String title;
  final String description;
  final void Function() onTap;
  const ItemListViewNude(
      {super.key,
      required this.title,
      required this.description,
      required this.uid,
      this.onTap = _attendacePage});

  static void _attendacePage() =>
      router.push('/login-kader/daftar-hadir-checkup');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: const GlobalTheme().primaryColor,
        border: Border.all(color: const GlobalTheme().primaryColor),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 1,
            offset: Offset(1.0, 1.0),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const GlobalTheme().secondaryColor,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              color: Colors.white,
              onPressed: onTap),
        ],
      ),
    );
  }
}
