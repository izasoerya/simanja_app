import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simanja_app/domain/entities/kader_checkup.dart';
import 'package:simanja_app/domain/entities/kader_event.dart';

final checkupProvider = StateProvider<List<KaderCheckup>>((ref) => []);
final eventProvider = StateProvider<List<EventKader>>((ref) => []);

void addCheckup(WidgetRef ref, KaderCheckup newCheckup) {
  final currentList = ref.watch(checkupProvider.notifier).state;
  ref.watch(checkupProvider.notifier).state = [...currentList, newCheckup];
}

void addEvent(WidgetRef ref, EventKader newEvent) {
  final currentList = ref.watch(eventProvider.notifier).state;
  ref.watch(eventProvider.notifier).state = [...currentList, newEvent];
}

void removeCheckup(WidgetRef ref, KaderCheckup checkupToRemove) {
  final currentList = ref.watch(checkupProvider.notifier).state;
  ref.watch(checkupProvider.notifier).state =
      currentList.where((checkup) => checkup != checkupToRemove).toList();
}

void removeEvent(WidgetRef ref, EventKader eventToRemove) {
  final currentList = ref.watch(eventProvider.notifier).state;
  ref.watch(eventProvider.notifier).state =
      currentList.where((event) => event != eventToRemove).toList();
}
