class KaderCheckup {
  final String uid;
  final String checkupTitle;
  final DateTime date;
  final bool isFinish;

  KaderCheckup({
    required this.uid,
    required this.checkupTitle,
    required this.date,
    this.isFinish = false,
  });

  KaderCheckup copyWith({
    String? uid,
    String? checkupTitle,
    DateTime? date,
    bool? isFinish,
  }) {
    return KaderCheckup(
      uid: uid ?? this.uid,
      checkupTitle: checkupTitle ?? this.checkupTitle,
      date: date ?? this.date,
      isFinish: isFinish ?? this.isFinish,
    );
  }
}
