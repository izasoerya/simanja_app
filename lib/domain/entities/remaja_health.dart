class HealthPropertiesRemaja {
  final String uid;
  final double weight;
  final double height;
  final double armCircumference;
  final double abdominalCircumference;
  final double bloodPressure;
  final double hemoglobin;
  final double cholesterol;
  final double bloodSugar;
  final double tds;
  final double tdd;
  final DateTime checkedAt;
  final bool kek;
  final bool anemia;
  final bool smoker;
  final bool tablet;
  final String note;

  HealthPropertiesRemaja({
    required this.uid,
    required this.weight,
    required this.height,
    required this.armCircumference,
    required this.abdominalCircumference,
    required this.bloodPressure,
    required this.hemoglobin,
    required this.cholesterol,
    required this.bloodSugar,
    required this.tds,
    required this.tdd,
    required this.checkedAt,
    required this.kek,
    required this.anemia,
    required this.smoker,
    required this.tablet,
    required this.note,
  });

  HealthPropertiesRemaja copyWith({
    String? uid,
    double? weight,
    double? height,
    double? armCircumference,
    double? abdominalCircumference,
    double? bloodPressure,
    double? hemoglobin,
    double? cholesterol,
    double? bloodSugar,
    double? tds,
    double? tdd,
    DateTime? checkedAt,
    bool? kek,
    bool? anemia,
    bool? smoker,
    bool? tablet,
    String? note,
  }) {
    return HealthPropertiesRemaja(
      uid: uid ?? this.uid,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      armCircumference: armCircumference ?? this.armCircumference,
      abdominalCircumference:
          abdominalCircumference ?? this.abdominalCircumference,
      bloodPressure: bloodPressure ?? this.bloodPressure,
      hemoglobin: hemoglobin ?? this.hemoglobin,
      cholesterol: cholesterol ?? this.cholesterol,
      bloodSugar: bloodSugar ?? this.bloodSugar,
      tds: tds ?? this.tds,
      tdd: tdd ?? this.tdd,
      checkedAt: checkedAt ?? this.checkedAt,
      kek: kek ?? this.kek,
      anemia: anemia ?? this.anemia,
      smoker: smoker ?? this.smoker,
      tablet: tablet ?? this.tablet,
      note: note ?? this.note,
    );
  }

  factory HealthPropertiesRemaja.fromJSON(Map<String, dynamic> json) {
    return HealthPropertiesRemaja(
      uid: json['uid'],
      weight: json['weight'],
      height: json['height'],
      armCircumference: json['arm_circumference'],
      abdominalCircumference: json['abdominal_circumference'],
      bloodPressure: json['blood_pressure'],
      hemoglobin: json['hemoglobin'],
      cholesterol: json['cholesterol'],
      bloodSugar: json['blood_sugar'],
      tds: json['tds'],
      tdd: json['tdd'],
      checkedAt: DateTime.parse(json['checked_at']),
      kek: json['kek'],
      anemia: json['anemia'],
      smoker: json['smoker'],
      tablet: json['tablet'],
      note: json['note'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'uid': uid,
      'weight': weight,
      'height': height,
      'arm_circumference': armCircumference,
      'abdominal_circumference': abdominalCircumference,
      'blood_pressure': bloodPressure,
      'hemoglobin': hemoglobin,
      'cholesterol': cholesterol,
      'blood_sugar': bloodSugar,
      'tds': tds,
      'tdd': tdd,
      'checked_at': checkedAt.toIso8601String(),
      'kek': kek,
      'anemia': anemia,
      'smoker': smoker,
      'tablet': tablet,
      'note': note,
    };
  }
}
