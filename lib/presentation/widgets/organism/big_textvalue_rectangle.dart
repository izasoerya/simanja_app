import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/presentation/provider/provider_user.dart';
import 'package:simanja_app/presentation/theme/global_theme.dart';
import 'package:sizer/sizer.dart';

class BigTextValueRectangle extends ConsumerWidget {
  final List<UserRemaja> users;
  const BigTextValueRectangle({super.key, required this.users});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        color: const GlobalTheme().primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            child: Column(
              children: [
                Text(
                  'Jumlah Remaja Terdaftar SiMandja',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Posyandu ${ref.watch(userKaderProvider).namePosyandu}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Text(
            users.length.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          )
        ],
      ),
    );
  }
}
