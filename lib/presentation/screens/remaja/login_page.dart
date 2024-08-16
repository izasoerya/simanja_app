import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';
import 'package:simanja_app/presentation/provider/provider_user.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_snackbar.dart';
import 'package:simanja_app/presentation/widgets/atom/nude_button.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';
import 'package:simanja_app/utils/default_account.dart';
import 'package:sizer/sizer.dart';

class LoginRemajaPage extends ConsumerStatefulWidget {
  const LoginRemajaPage({super.key});

  void _pushToRegister() => router.go('/register-remaja');
  void _pushToForgotPassword() => router.go('/forgot-password');
  void _pushToDashboard() => router.replace('/login-remaja/dashboard-remaja');

  @override
  ConsumerState<LoginRemajaPage> createState() => _LoginRemajaPageState();
}

class _LoginRemajaPageState extends ConsumerState<LoginRemajaPage> {
  String _email = '';
  void _readEmail(data) => _email = data;

  String _password = '';
  void _readPassword(data) => _password = data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
              scale:
                  SizerUtil.deviceType == DeviceType.tablet ? 0.3.sp : 0.8.sp,
            ),
            Padding(padding: EdgeInsets.only(top: 5.h)),
            Container(
              width: 90.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  Text(
                    'Masuk Remaja',
                    style: const GlobalTheme().headerStyle,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  TextInput(
                    hintText: 'Email',
                    labelText: 'Email',
                    type: TextInputType.emailAddress,
                    action: TextInputAction.next,
                    value: _readEmail,
                  ),
                  TextInput(
                    hintText: 'Kata Sandi',
                    labelText: 'Kata Sandi',
                    type: TextInputType.visiblePassword,
                    hideText: true,
                    value: _readPassword,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  SubmitButton(
                    text: 'Masuk',
                    onClick: () async {
                      UserRemaja user = remajaAccount.copyWith(
                          email: _email, password: _password);
                      final fetchedUser =
                          await RemajaAuthentication().loginUser(user);

                      if (fetchedUser != null) {
                        showCustomSnackbar(context, 'Berhasil Masuk', 0);
                        setUserRemaja(ref, fetchedUser);
                        widget._pushToDashboard();
                      } else {
                        showCustomSnackbar(
                            context, 'Email atau Kata Sandi Salah', 2);
                      }
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  NudeButton(
                      text: 'Lupa Kata Sandi?',
                      redirect: () => widget._pushToForgotPassword()),
                  NudeButton(text: 'Daftar', redirect: widget._pushToRegister),
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
