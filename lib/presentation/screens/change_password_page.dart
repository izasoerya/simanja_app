import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_snackbar.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordPage extends StatefulWidget {
  final String email;
  const ChangePasswordPage({super.key, required this.email});

  @override
  State<ChangePasswordPage> createState() => OtpVerificationPageState();
}

class OtpVerificationPageState extends State<ChangePasswordPage> {
  String _newPassword = '';
  void _readNewPassword(data) => _newPassword = data;

  String _rePassword = '';
  void _readRePassword(data) => _rePassword = data;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15),
            ),
            Image.asset(
              'assets/logo/Logo Word.png',
              scale: 0.8.sp,
            ),
            Padding(padding: EdgeInsets.only(top: 5.h)),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  Text(
                    'Password Baru',
                    style: const GlobalTheme().headerStyle,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    'Masukkan Password Baru Anda',
                    style: const GlobalTheme().paragraphStyle.copyWith(
                        fontSize: 10.sp,
                        color: const GlobalTheme().primaryColor),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  TextInput(
                    hintText: 'Masukkan Password...',
                    labelText: 'Password',
                    type: TextInputType.emailAddress,
                    action: TextInputAction.next,
                    value: _readNewPassword,
                  ),
                  TextInput(
                    hintText: 'Masukkan Password Baru...',
                    labelText: 'Password Baru',
                    type: TextInputType.emailAddress,
                    action: TextInputAction.done,
                    value: _readRePassword,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  SubmitButton(
                      text: 'Submit',
                      onClick: () async {
                        if (_newPassword.isEmpty || _rePassword.isEmpty) {
                          showCustomSnackbar(
                              context, 'Harap isi semua field', 2);
                        } else if (_newPassword != _rePassword) {
                          showCustomSnackbar(context, 'Password tidak sama', 2);
                        } else {
                          showCustomSnackbar(context, 'Berhasil', 0);
                        }
                      }),
                  const Padding(padding: EdgeInsets.only(top: 50)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
