import 'package:flutter/material.dart';

class ItemListviewImage extends StatelessWidget {
  final String title;
  final String uid;
  final List<String> descriptions;
  final void Function(String callBack) onTap;
  const ItemListviewImage({
    super.key,
    required this.title,
    required this.uid,
    required this.descriptions,
    required this.onTap,
  });

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
          height: 45,
          width: MediaQuery.of(context).size.width * 0.625,
          color: Colors.yellow[100], //! CHANGE TO SIZEDBOX IN PRODUCTION
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
              IconButton(
                  onPressed: () => onTap(title),
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
