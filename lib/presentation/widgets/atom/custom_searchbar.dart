import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String label;
  final IconData icon;

  const CustomSearchBar({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: label,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
