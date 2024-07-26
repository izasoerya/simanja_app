// ignore_for_file: avoid_print

class KaderCheckup {
  final String uid;
  final String checkupTitle;
  final DateTime dateEvent;
  final bool isFinish;

  KaderCheckup({
    required this.uid,
    required this.checkupTitle,
    required this.dateEvent,
    this.isFinish = false,
  });

  KaderCheckup copyWith({
    String? uid,
    String? checkupTitle,
    DateTime? dateEvent,
    bool? isFinish,
  }) {
    return KaderCheckup(
      uid: uid ?? this.uid,
      checkupTitle: checkupTitle ?? this.checkupTitle,
      dateEvent: dateEvent ?? this.dateEvent,
      isFinish: isFinish ?? this.isFinish,
    );
  }

  void debugData() {
    print('uid: $uid');
    print('checkupTitle: $checkupTitle');
    print('date: $dateEvent');
    print('isFinish: $isFinish');
  }
}
