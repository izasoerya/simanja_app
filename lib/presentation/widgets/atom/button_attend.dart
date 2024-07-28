import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class ButtonAttend extends StatelessWidget {
  final void Function() onTap;
  const ButtonAttend({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 50,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: const GlobalTheme().primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 15),
            Text('HADIR',
                style: const GlobalTheme().paragraphStyle.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
