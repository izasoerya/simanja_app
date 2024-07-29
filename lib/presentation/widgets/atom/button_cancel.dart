import 'package:flutter/material.dart';

class ButtonCancel extends StatelessWidget {
  final void Function() onTap;
  const ButtonCancel({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.175,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: const Icon(Icons.cancel),
        onPressed: onTap,
        color: Colors.white,
      ),
    );
  }
}
