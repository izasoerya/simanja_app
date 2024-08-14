import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/image_box.dart';
import 'package:simanja_app/utils/enums.dart';

class ImageBoxHealthInput extends StatefulWidget {
  final HealthInputObject defaultValue;
  final void Function(HealthInputObject) onTap;
  const ImageBoxHealthInput(
      {super.key, required this.onTap, required this.defaultValue});

  @override
  State<ImageBoxHealthInput> createState() => _ImageBoxHealthInput();
}

class _ImageBoxHealthInput extends State<ImageBoxHealthInput> {
  final Image imageIMT = Image.asset('assets/logo/4.png');
  final Image imageKEK = Image.asset('assets/logo/6.png');
  final Image imageBC = Image.asset('assets/logo/7.png');
  final Image imageOther =
      Image.asset('assets/logo/consult.png', color: Colors.white);
  late HealthInputObject _selectedObject;

  @override
  void initState() {
    super.initState();
    _selectedObject = widget.defaultValue;
  }

  Widget buildImageBox(Image image, String label, HealthInputObject object) {
    return GestureDetector(
      onTap: () => setState(() {
        _selectedObject = object;
        widget.onTap(object);
      }),
      child: Column(
        children: [
          ImageBox(
            image: image,
            label: label,
            color: _selectedObject == object
                ? const GlobalTheme().primaryColor
                : null,
            enableUnderline: _selectedObject == object,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildImageBox(imageIMT, 'Periksa BB / TB', HealthInputObject.imt),
          buildImageBox(imageKEK, 'Periksa LiLa/LP', HealthInputObject.kek),
          buildImageBox(imageBC, 'Periksa Darah', HealthInputObject.bloodCheck),
          buildImageBox(imageOther, 'Lainnya', HealthInputObject.consultation),
        ],
      ),
    );
  }
}
