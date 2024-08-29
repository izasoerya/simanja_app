import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/services/kader_auth_service.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_snackbar.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  String _email = '';
  void _readEmail(data) => _email = data;

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
                    top: MediaQuery.of(context).size.height * 0.15)),
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
                    'Lupa Kata Sandi',
                    style: const GlobalTheme().headerStyle,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    'Masukkan email yang terdaftar',
                    style: const GlobalTheme().paragraphStyle.copyWith(
                        fontSize: 10.sp,
                        color: const GlobalTheme().primaryColor),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  TextInput(
                    hintText: 'Email',
                    labelText: 'Email',
                    type: TextInputType.emailAddress,
                    action: TextInputAction.done,
                    value: _readEmail,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  SubmitButton(
                      text: 'Submit',
                      onClick: () async {
                        final remaja =
                            await RemajaAuthentication().getUserbyEmail(_email);
                        final kader =
                            await KaderAuthentication().getUserbyEmail(_email);
                        if (remaja == null && kader == null) {
                          showCustomSnackbar(
                              context, 'Email Tidak Terdaftar', 2);
                          return;
                        } else {
                          EmailOTP.sendOTP(email: _email);
                          router.push('/otp-verification?email=$_email');
                          showCustomSnackbar(
                              context, 'OTP Telah dikirimkan ke Email', 0);
                        }
                      }),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
