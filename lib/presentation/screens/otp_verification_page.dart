import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_snackbar.dart';
import 'package:simanja_app/presentation/widgets/atom/nude_button.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:sizer/sizer.dart';

class OtpVerificationPage extends StatefulWidget {
  final String email;
  const OtpVerificationPage({super.key, required this.email});

  @override
  State<OtpVerificationPage> createState() => OtpVerificationPageState();
}

class OtpVerificationPageState extends State<OtpVerificationPage> {
  late CountdownController _controller;

  String _otp = '';
  void _readOTP(data) => _otp = data;

  @override
  void initState() {
    super.initState();
    _controller = CountdownController(autoStart: true);
  }

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
                    'Verifikasi OTP',
                    style: const GlobalTheme().headerStyle,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    'Masukkan OTP yang telah dikirimkan ke email yang anda tuliskan',
                    style: const GlobalTheme().paragraphStyle.copyWith(
                        fontSize: 10.sp,
                        color: const GlobalTheme().primaryColor),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Text(
                    'Kode OTP akan kadaluarsa dalam: ',
                    style: const GlobalTheme().paragraphStyle.copyWith(
                        fontSize: 10.sp,
                        color: const GlobalTheme().primaryColor),
                  ),
                  Countdown(
                    controller: _controller,
                    seconds: 59,
                    build: (_, double time) => Text(
                      '${time.toInt()} detik',
                      style: const GlobalTheme().headerStyle,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  TextInput(
                    hintText: 'Masukkan OTP...',
                    labelText: 'Kode OTP',
                    type: TextInputType.emailAddress,
                    action: TextInputAction.next,
                    value: _readOTP,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  SubmitButton(
                      text: 'Submit',
                      onClick: () async {
                        final otp = EmailOTP.verifyOTP(otp: _otp);
                        if (otp) {
                          showCustomSnackbar(context, 'OTP Valid', 0);
                          router.go('/change-password?email=${widget.email}');
                        } else {
                          showCustomSnackbar(context, 'OTP Tidak Valid', 2);
                        }
                      }),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  NudeButton(
                    text: 'Kirim Ulang OTP',
                    redirect: () {
                      EmailOTP.sendOTP(email: widget.email);
                      showCustomSnackbar(context, 'OTP Telah Dikirimkan', 0);
                      setState(() => _controller.restart());
                    },
                  ),
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
