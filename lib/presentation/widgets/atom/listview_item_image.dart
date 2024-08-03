import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
          width: MediaQuery.of(context).size.width * 0.1,
          child: Image.asset('assets/logo/No_Image.jpg'),
        ),
        Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.025)),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.675,
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
                    style: TextStyle(
                      fontSize: 6.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  ...descriptions.map((text) => Text(
                        text,
                        style: TextStyle(
                          fontSize: 4.sp,
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
