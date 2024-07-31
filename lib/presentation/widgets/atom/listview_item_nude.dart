import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class ItemListViewNude extends StatelessWidget {
  final String uid;
  final String title;
  final String description;
  final bool isFinish;
  final void Function() onTap;
  const ItemListViewNude(
      {super.key,
      required this.title,
      required this.description,
      required this.uid,
      this.isFinish = false,
      this.onTap = _attendacePage});

  static void _attendacePage() =>
      router.push('/login-kader/daftar-hadir-checkup');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const GlobalTheme().secondaryColor,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Row(
            children: [
              !isFinish
                  ? Container(
                      padding: const EdgeInsets.all(7.5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Text(
                        'Masih Berlangsung',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : const SizedBox(),
              IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  color: Colors.white,
                  onPressed: onTap),
            ],
          )
        ],
      ),
    );
  }
}
