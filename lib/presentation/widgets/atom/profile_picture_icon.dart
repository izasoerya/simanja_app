import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/domain/services/kader_auth_service.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:sizer/sizer.dart';

class ProfilePictureIcon extends StatelessWidget {
  final UserKader? kader;
  final UserRemaja? remaja;
  final bool isSelf;
  const ProfilePictureIcon(
      {super.key, this.kader, this.remaja, required this.isSelf});

  Future<void> _pickFile(UserKader? kader, UserRemaja? remaja) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      String? filePath = result.files.single.path;
      if (filePath != null) {
        if (kader != null) {
          final newKader = kader.copyWith(urlImage: filePath);
          await KaderAuthentication().updateProfilePicture(newKader);
        }
        // else if (remaja != null) {
        //   final response =
        //       await KaderAuthentication().updateProfilePicture(remaja);
        //   if (response!.urlImage != null) {
        //     print('Profile Picture Updated for Remaja');
        //   }
        // }
      }
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 10.w,
          backgroundColor: const GlobalTheme().primaryColor,
          backgroundImage: kader?.urlImage != null
              ? NetworkImage(kader!.urlImage!)
              : const AssetImage('assets/logo/No_Profil_Picture.png'),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: isSelf
              ? GestureDetector(
                  onTap: () => _pickFile(
                      kader, remaja), // Pass the appropriate parameters here
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
