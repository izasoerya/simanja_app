import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/domain/services/kader_auth_service.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/utils/default_account.dart';
import 'package:sizer/sizer.dart';

class ProfilePictureIcon extends StatefulWidget {
  final UserKader? kader;
  final UserRemaja? remaja;
  final bool isSelf;
  const ProfilePictureIcon(
      {super.key, this.kader, this.remaja, required this.isSelf});

  @override
  State<ProfilePictureIcon> createState() => _ProfilePictureIconState();
}

class _ProfilePictureIconState extends State<ProfilePictureIcon> {
  late dynamic user; // Can be either UserKader or UserRemaja

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      String? filePath = result.files.single.path;
      if (filePath != null) {
        if (user is UserKader) {
          final newUser = (user as UserKader).copyWith(urlImage: filePath);
          final updatedUser =
              await KaderAuthentication().updateProfilePicture(newUser);
          if (updatedUser != null) {
            kaderAccount.urlImage = updatedUser.urlImage;
            setState(() => user = updatedUser);
            router.pop();
          }
        } else if (user is UserRemaja) {
          final newUser = (user as UserRemaja).copyWith(urlImage: filePath);
          final updatedUser =
              await RemajaAuthentication().updateProfilePicture(newUser);
          if (updatedUser != null) {
            remajaAccount.urlImage = updatedUser.urlImage;
            setState(() => user = updatedUser);
            router.pop();
          }
        }
      }
    } else {
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    user = widget.kader ?? widget.remaja;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 10.w,
          backgroundColor: const GlobalTheme().primaryColor,
          backgroundImage: user.urlImage != null
              ? NetworkImage(user.urlImage!)
              : const AssetImage('assets/logo/No_Profil_Picture.png')
                  as ImageProvider,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: widget.isSelf
              ? GestureDetector(
                  onTap: _pickFile,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4.0),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
