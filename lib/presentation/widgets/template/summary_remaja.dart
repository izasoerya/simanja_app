import 'package:flutter/widgets.dart';

class SummaryRemaja extends StatelessWidget {
  const SummaryRemaja({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
          itemBuilder: (context, index) {
            return const Text('Summary Rem`aja');
          },
          itemCount: 10),
    );
  }
}
