class HealthPropertiesRemaja {
  String? uid;
  String? uidCheckup;
  String? uidRemaja;
  double? weight;
  double? height;
  double? armCircumference;
  double? abdominalCircumference;
  String? get bloodPressure {
    if (tds == null || tdd == null) {
      return 'nan mmHg';
    }
    return '$tds/$tdd mmHg';
  }

  double? get imt {
    if (weight == null || height == null) {
      return null;
    }
    return weight! / ((height! / 100) * (height! / 100));
  }

  double? hemoglobin;
  double? cholesterol;
  double? bloodSugar;
  double? tds;
  double? tdd;
  DateTime? checkedAt;
  bool? kek;
  bool? anemia;
  bool? smoker;
  bool? tablet;
  String? note;

  HealthPropertiesRemaja({
    this.uid,
    this.uidCheckup,
    this.uidRemaja,
    this.weight,
    this.height,
    this.armCircumference,
    this.abdominalCircumference,
    this.hemoglobin,
    this.cholesterol,
    this.bloodSugar,
    this.tds,
    this.tdd,
    this.checkedAt,
    this.kek,
    this.anemia,
    this.smoker,
    this.tablet,
    this.note,
  });

  HealthPropertiesRemaja copyWith({
    String? uid,
    String? uidCheckup,
    String? uidRemaja,
    double? weight,
    double? height,
    double? armCircumference,
    double? abdominalCircumference,
    String? bloodPressure,
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
      uidCheckup: uidCheckup ?? this.uidCheckup,
      uidRemaja: uidRemaja ?? this.uidRemaja,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      armCircumference: armCircumference ?? this.armCircumference,
      abdominalCircumference:
          abdominalCircumference ?? this.abdominalCircumference,
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
      uidCheckup: json['checkup_uid'],
      uidRemaja: json['uid_remaja'],
      weight: json['weight'] != null
          ? double.parse(json['weight'].toString())
          : null,
      height: json['height'] != null
          ? double.parse(json['height'].toString())
          : null,
      armCircumference: json['arm_radius'] != null
          ? double.parse(json['arm_radius'].toString())
          : null,
      abdominalCircumference: json['abdominal_radius'] != null
          ? double.parse(json['abdominal_radius'].toString())
          : null,
      hemoglobin: json['hemoglobin'] != null
          ? double.parse(json['hemoglobin'].toString())
          : null,
      cholesterol: json['cholesterol'] != null
          ? double.parse(json['cholesterol'].toString())
          : null,
      bloodSugar: json['blood_sugar'] != null
          ? double.parse(json['blood_sugar'].toString())
          : null,
      tds: json['tds'] != null ? double.parse(json['tds'].toString()) : null,
      tdd: json['tdd'] != null ? double.parse(json['tdd'].toString()) : null,
      checkedAt: json['checked_at'] != null
          ? DateTime.parse(json['checked_at'])
          : null,
      kek: json['status_kek'],
      anemia: json['status_anemia'],
      smoker: json['status_smoker'],
      tablet: json['status_tablet'],
      note: json['doctor_note'],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'uid': uid,
      'checkup_uid': uidCheckup,
      'uid_remaja': uidRemaja,
      'weight': weight,
      'height': height,
      'arm_radius': armCircumference,
      'abdominal_radius': abdominalCircumference,
      'blood_pressure': bloodPressure,
      'hemoglobin': hemoglobin,
      'cholesterol': cholesterol,
      'blood_sugar': bloodSugar,
      'tds': tds,
      'tdd': tdd,
      'checked_at': checkedAt!.toIso8601String(),
      'status_kek': kek,
      'status_anemia': anemia,
      'status_smoker': smoker,
      'status_tablet': tablet,
      'doctor_note': note,
    };
  }
}
