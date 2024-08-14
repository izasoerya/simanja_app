import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ItemListviewImage extends StatelessWidget {
  final String title;
  final String uid;
  final List<String> descriptions;
  final Image? image;
  final void Function(String callBack) onTap;
  const ItemListviewImage({
    super.key,
    required this.title,
    required this.uid,
    required this.descriptions,
    required this.onTap,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: screenWidth * 0.15,
          height: screenHeight * 0.075,
          child: image ?? Image.asset('assets/logo/No_Image.jpg'),
        ),
        Padding(padding: EdgeInsets.only(left: screenWidth * 0.025)),
        SizedBox(
          height: screenHeight * 0.075,
          width: screenWidth * 0.625,
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
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  ...descriptions.map((text) => Text(
                        text,
                        style: TextStyle(
                          fontSize: 6.sp,
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
