import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageIndexProvider = StateProvider<int>((ref) {
  return 0;
});

void changePageIndex(WidgetRef ref, int index) {
  ref.watch(pageIndexProvider.notifier).state = index;
}
