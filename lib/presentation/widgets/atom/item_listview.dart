import 'package:flutter/widgets.dart';

class ItemListview extends StatelessWidget {
  final String title;
  final List<String> descriptions;
  const ItemListview(
      {super.key, required this.title, required this.descriptions});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.125,
          child: Image.asset('assets/logo/No_Image.jpg'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              ...descriptions
                  .map((text) => Text(
                        text,
                        textAlign: TextAlign.left,
                      ))
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}
