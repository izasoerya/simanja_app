import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';

final checkupProvider = StateProvider<List<KaderCheckup>?>((ref) {
  return null;
});

void addCheckup(WidgetRef ref, KaderCheckup newCheckup) {
  final currentList = ref.read(checkupProvider.notifier).state ?? [];
  ref.read(checkupProvider.notifier).state = [...currentList, newCheckup];
}

void removeCheckup(WidgetRef ref, KaderCheckup checkupToRemove) {
  final currentList = ref.read(checkupProvider.notifier).state ?? [];
  ref.read(checkupProvider.notifier).state =
      currentList.where((checkup) => checkup != checkupToRemove).toList();
}
