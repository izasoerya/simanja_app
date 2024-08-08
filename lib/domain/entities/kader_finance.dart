class FinanceKader {
  final String uid;
  final String uidPosyandu;
  final String value;
  final String description;
  final DateTime date;
  final bool isDeposit;
  final String total;

  FinanceKader({
    required this.isDeposit,
    required this.uidPosyandu,
    required this.value,
    required this.description,
    required this.date,
    required this.uid,
    required this.total,
  });

  FinanceKader copyWith({
    String? uid,
    String? uidPosyandu,
    String? value,
    String? description,
    DateTime? date,
    bool? isDeposit,
    String? total,
  }) {
    return FinanceKader(
      uid: uid ?? this.uid,
      uidPosyandu: uidPosyandu ?? this.uidPosyandu,
      value: value ?? this.value,
      description: description ?? this.description,
      date: date ?? this.date,
      isDeposit: isDeposit ?? this.isDeposit,
      total: total ?? this.total,
    );
  }

  factory FinanceKader.fromJSON(Map<String, dynamic> map) {
    return FinanceKader(
      uid: map['uid'],
      uidPosyandu: map['posyandu_uid'],
      value: map['value'],
      description: map['description'],
      date: DateTime.parse(map['created_at']),
      isDeposit: map['is_deposit'],
      total: map['total_kas'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'uid': uid,
      'posyandu_uid': uidPosyandu,
      'value': value,
      'description': description,
      'created_at': date.toIso8601String().substring(0, 10),
      'is_deposit': isDeposit,
      'total_kas': total,
    };
  }
}
