import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';

class SubPageLayout extends StatelessWidget {
  final String appBarTitle;
  final Widget child;
  const SubPageLayout(
      {super.key, required this.appBarTitle, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: const GlobalTheme().primaryColor,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            appBarTitle,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            padding: const EdgeInsets.only(left: 15),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(child: child),
    );
  }
}
