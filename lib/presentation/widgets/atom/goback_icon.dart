import 'package:flutter/material.dart';

class BackButtonAppbar extends StatelessWidget {
  const BackButtonAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 60,
      height: 60,
      child: Icon(Icons.arrow_back_ios_new_sharp),
    );
  }
}
