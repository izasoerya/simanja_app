import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalTheme().primaryColor,
      body: child,
    );
  }
}
