import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';

final checkupProvider = StateProvider<List<KaderCheckup>>((ref) => []);

void addCheckup(WidgetRef ref, KaderCheckup newCheckup) {
  final currentList = ref.watch(checkupProvider.notifier).state;
  ref.watch(checkupProvider.notifier).state = [...currentList, newCheckup];
}

void removeCheckup(WidgetRef ref, KaderCheckup checkupToRemove) {
  final currentList = ref.watch(checkupProvider.notifier).state;
  ref.watch(checkupProvider.notifier).state =
      currentList.where((checkup) => checkup != checkupToRemove).toList();
}
