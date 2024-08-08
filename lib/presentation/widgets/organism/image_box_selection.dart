import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/image_box.dart';
import 'package:simanja_app/utils/enums.dart';

class ImageBoxSelection extends StatefulWidget {
  final ManagementObject defaultValue;
  final void Function(ManagementObject) onTap;
  const ImageBoxSelection(
      {super.key, required this.onTap, required this.defaultValue});

  @override
  State<ImageBoxSelection> createState() => _ImageBoxSelectionState();
}

class _ImageBoxSelectionState extends State<ImageBoxSelection> {
  final Image imageInventory =
      Image.asset('assets/logo/Kelola_Inventaris_Icon.png');
  final Image imageKas = Image.asset('assets/logo/Kelola_Kas_Icon.png');
  late ManagementObject _selectedObject;

  @override
  void initState() {
    super.initState();
    _selectedObject = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                _selectedObject = ManagementObject.inventaris;
              });
              widget.onTap(ManagementObject.inventaris);
            },
            child: ImageBox(
              image: imageInventory,
              label: 'Inventaris\nPosyandu',
              color: _selectedObject == ManagementObject.inventaris
                  ? const GlobalTheme().primaryColor
                  : Colors.grey,
              enableUnderline: _selectedObject == ManagementObject.inventaris,
            )),
        const Padding(padding: EdgeInsets.only(left: 20)),
        GestureDetector(
            onTap: () {
              setState(() {
                _selectedObject = ManagementObject.kas;
              });
              widget.onTap(ManagementObject.kas);
            },
            child: ImageBox(
              image: imageKas,
              label: 'Kas\nPosyandu',
              color: _selectedObject == ManagementObject.kas
                  ? const GlobalTheme().primaryColor
                  : Colors.grey,
              enableUnderline: _selectedObject == ManagementObject.kas,
            )),
      ],
    );
  }
}
