import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/atom/appbar_text.dart';

class AppbarContent extends StatelessWidget {
  final bool isKader;
  const AppbarContent({super.key, required this.isKader});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(top: 20)),
        Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 15)),
            const Image(
                image: AssetImage('assets/logo/SiMandja-Logo.png'),
                width: 100,
                height: 100),
            const Padding(padding: EdgeInsets.only(left: 15)),
            AppbarText(isKader: isKader),
          ],
        ),
        const SizedBox(
            height: 10), // Add some space between the row and the line
        Container(
          height: 2, // Thickness of the line
          width: MediaQuery.of(context).size.width * 0.9,
          color: Colors.orange, // Color of the line
          margin: const EdgeInsets.symmetric(
              horizontal: 20), // Optional: Add some horizontal margin
        ),
      ],
    );
  }
}
