import 'package:flutter/material.dart';
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
          width: 45,
          child: Image.asset('assets/logo/No_Image.jpg'),
        ),
        const Padding(padding: EdgeInsets.only(left: 15)),
        Container(
          color: Colors.yellow[100], //! CHANGE TO SIZEDBOX IN PRODUCTION
          width: MediaQuery.of(context).size.width * 0.625,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              ...descriptions.map((text) => Text(
                    text,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.left,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
