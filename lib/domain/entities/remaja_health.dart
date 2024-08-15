class HealthPropertiesRemaja {
  String? uid;
  String? uidCheckup;
  String? uidRemaja;
  int? age;
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
  double? vena;
  double? capillar;
  double? tds;
  double? tdd;
  DateTime? checkedAt;

  String? get statusIMT {
    if (imt == null) {
      return null;
    } else if (imt! < 17.0) {
      return 'Sangat Kurus';
    } else if (imt! >= 17.0 && imt! <= 18.5) {
      return 'Kurus';
    } else if (imt! > 18.5 && imt! <= 25.0) {
      return 'Normal';
    } else if (imt! > 25.0 && imt! <= 27.0) {
      return 'Gemuk';
    } else if (imt! > 27.0) {
      return 'Obesitas';
    } else {
      return 'Belum ada data';
    }
  }

  String? get kek {
    if (armCircumference == null) {
      return null;
    } else if (armCircumference! < 18.5 && age! > 10 && age! < 14) {
      return 'KEK';
    } else if (armCircumference! < 22 && age! > 15 && age! < 17) {
      return 'KEK';
    } else if (armCircumference! < 23.5 && age! >= 17) {
      return 'KEK';
    } else {
      return 'Non-KEK';
    }
  }

  String? get anemia {
    if (hemoglobin == null) {
      return null;
    } else if (hemoglobin! < 8.0) {
      return 'Berat';
    } else if (hemoglobin! < 10.9 && hemoglobin! >= 8.0) {
      return 'Sedang';
    } else if (hemoglobin! < 11.0 && hemoglobin! >= 12.9) {
      return 'Ringan';
    } else {
      return 'Non-Anemia';
    }
  }

  String? get hipertensi {
    if (tds == null || tdd == null) {
      return null;
    } else if (tds! < 120 && tdd! < 80) {
      return 'Normal';
    } else if (tds! >= 120 && tds! <= 139 && tdd! <= 80 && tdd! >= 89) {
      return 'Pra Hipertensi';
    } else if (tds! > 140 && tds! < 159 && tdd! > 90 && tdd! < 99) {
      return 'Hipertensi Level 1';
    } else if (tds! >= 160 || tdd! >= 100) {
      return 'Hipertensi Level 2';
    } else {
      return 'Non-Hipertensi';
    }
  }

  String? get bloodSugar {
    if (vena == null || capillar == null) {
      return null;
    } else if (vena! >= 200 || capillar! >= 200) {
      return 'Tinggi';
    } else if (vena! >= 126 || capillar! <= 100) {
      return 'Tinggi';
    } else {
      return 'Normal';
    }
  }

  String? get statusCholesterol {
    if (cholesterol == null) {
      return null;
    } else if (cholesterol! < 200) {
      return 'Normal';
    } else if (cholesterol! >= 200 && cholesterol! <= 239) {
      return 'Sedikit Tinggi';
    } else if (cholesterol! >= 240) {
      return 'Tinggi';
    } else {
      return 'Normal';
    }
  }

  bool? smoker;
  bool? tablet;
  String? note;

  HealthPropertiesRemaja({
    this.uid,
    this.uidCheckup,
    this.uidRemaja,
    this.age,
    this.weight,
    this.height,
    this.armCircumference,
    this.abdominalCircumference,
    this.hemoglobin,
    this.cholesterol,
    this.vena,
    this.capillar,
    this.tds,
    this.tdd,
    this.checkedAt,
    this.smoker,
    this.tablet,
    this.note,
  });

  HealthPropertiesRemaja copyWith({
    String? uid,
    String? uidCheckup,
    String? uidRemaja,
    int? age,
    double? weight,
    double? height,
    double? armCircumference,
    double? abdominalCircumference,
    double? vena,
    double? capillar,
    double? hemoglobin,
    double? cholesterol,
    double? bloodSugar,
    double? tds,
    double? tdd,
    DateTime? checkedAt,
    bool? smoker,
    bool? tablet,
    String? note,
  }) {
    return HealthPropertiesRemaja(
      uid: uid ?? this.uid,
      uidCheckup: uidCheckup ?? this.uidCheckup,
      uidRemaja: uidRemaja ?? this.uidRemaja,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      armCircumference: armCircumference ?? this.armCircumference,
      abdominalCircumference:
          abdominalCircumference ?? this.abdominalCircumference,
      hemoglobin: hemoglobin ?? this.hemoglobin,
      cholesterol: cholesterol ?? this.cholesterol,
      vena: vena ?? this.vena,
      capillar: capillar ?? this.capillar,
      tds: tds ?? this.tds,
      tdd: tdd ?? this.tdd,
      checkedAt: checkedAt ?? this.checkedAt,
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
      age: json['age'],
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
      vena: json['vena'] != null ? double.parse(json['vena'].toString()) : null,
      capillar: json['capillar'] != null
          ? double.parse(json['capillar'].toString())
          : null,
      tds: json['tds'] != null ? double.parse(json['tds'].toString()) : null,
      tdd: json['tdd'] != null ? double.parse(json['tdd'].toString()) : null,
      checkedAt: json['checked_at'] != null
          ? DateTime.parse(json['checked_at'])
          : null,
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
      'age': age,
      'imt': imt,
      'arm_radius': armCircumference,
      'abdominal_radius': abdominalCircumference,
      'blood_pressure': bloodPressure,
      'hemoglobin': hemoglobin,
      'cholesterol': cholesterol,
      'vena': vena,
      'capillar': capillar,
      'tds': tds,
      'tdd': tdd,
      'checked_at': checkedAt!.toIso8601String(),
      'status_imt': statusIMT,
      'status_kek': kek,
      'status_anemia': anemia,
      'status_hipertensi': hipertensi,
      'status_cholesterol': statusCholesterol,
      'status_blood_sugar': bloodSugar,
      'status_smoker': smoker,
      'status_tablet': tablet,
      'doctor_note': note,
    };
  }
}
