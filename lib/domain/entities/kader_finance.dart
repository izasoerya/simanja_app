class FinanceKader {
  final String uid;
  final String uidPosyandu;
  final int idIncrement;
  final String value;
  final String description;
  final DateTime date;
  final bool isDeposit;
  final String total;
  final String source;

  FinanceKader({
    required this.isDeposit,
    required this.uidPosyandu,
    required this.idIncrement,
    required this.value,
    required this.description,
    required this.date,
    required this.uid,
    required this.total,
    required this.source,
  });

  FinanceKader copyWith({
    String? uid,
    String? uidPosyandu,
    int? idIncrement,
    String? value,
    String? description,
    DateTime? date,
    bool? isDeposit,
    String? total,
    String? source,
  }) {
    return FinanceKader(
      uid: uid ?? this.uid,
      uidPosyandu: uidPosyandu ?? this.uidPosyandu,
      idIncrement: idIncrement ?? this.idIncrement,
      value: value ?? this.value,
      description: description ?? this.description,
      date: date ?? this.date,
      isDeposit: isDeposit ?? this.isDeposit,
      total: total ?? this.total,
      source: source ?? this.source,
    );
  }

  factory FinanceKader.fromJSON(Map<String, dynamic> map) {
    return FinanceKader(
      uid: map['uid'],
      uidPosyandu: map['posyandu_uid'],
      idIncrement: map['id_increment'],
      value: map['value'],
      description: map['description'],
      date: DateTime.parse(map['date']),
      isDeposit: map['is_deposit'],
      total: map['total_kas'],
      source: map['source'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'uid': uid,
      'posyandu_uid': uidPosyandu,
      'id_increment': idIncrement,
      'value': value,
      'description': description,
      'date': date.toIso8601String().substring(0, 10),
      'is_deposit': isDeposit,
      'total_kas': total,
      'source': source,
    };
  }
}
