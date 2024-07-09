import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/atom/appbar_text.dart';

class AppbarDashboard extends StatelessWidget {
  const AppbarDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 20)),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: AssetImage('assets/logo/SiMandja-Logo.png'),
                width: 100,
                height: 100),
            Padding(padding: EdgeInsets.only(left: 30)),
            AppbarText(),
          ],
        ),
        const SizedBox(
            height: 10), // Add some space between the row and the line
        Container(
          height: 2, // Thickness of the line
          width: MediaQuery.of(context).size.width * 0.8,
          color: Colors.orange, // Color of the line
          margin: const EdgeInsets.symmetric(
              horizontal: 20), // Optional: Add some horizontal margin
        ),
      ],
    );
  }
}
