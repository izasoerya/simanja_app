import 'package:flutter/material.dart';

class BackButtonAppbar extends StatelessWidget {
  final void Function() onTap;
  const BackButtonAppbar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: GestureDetector(
          onTap: () => onTap,
          child: const Icon(Icons.arrow_back_ios_new_sharp)),
    );
  }
}
