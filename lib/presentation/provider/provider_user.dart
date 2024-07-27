import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_auth.dart';
import 'package:simanja_app/domain/entities/remaja_auth.dart';
import 'package:simanja_app/utils/default_account.dart';

final userRemajaProvider = StateProvider<UserRemaja>((ref) {
  return remajaAccount;
});

final userKaderProvider = StateProvider<UserKader>((ref) {
  return kaderAccount;
});

void setUserRemaja(WidgetRef ref, UserRemaja user) {
  ref.read(userRemajaProvider.notifier).state = user;
  remajaAccount = user;
}

void setUserKader(WidgetRef ref, UserKader user) {
  ref.read(userKaderProvider.notifier).state = user;
  kaderAccount = user;
}
