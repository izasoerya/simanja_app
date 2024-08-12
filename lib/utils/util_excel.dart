import 'dart:io';

import 'package:excel/excel.dart';
import 'package:path/path.dart';
import 'package:simanja_app/domain/entities/remaja_health.dart';
import 'package:simanja_app/domain/services/remaja_auth_service.dart';

class ExcelDataType {
  String name;
  String age;
  HealthPropertiesRemaja data;

  ExcelDataType(this.name, this.age, this.data);
}

class UtilExcel {
  Future<bool?> createExcel(List<HealthPropertiesRemaja?> items) async {
    final Excel excel = Excel.createExcel();
    final Sheet sheet = excel['Sheet1'];

    List<ExcelDataType> excelItems = [];

    for (var e in items) {
      if (e!.uidRemaja != null) {
        try {
          final data = await RemajaAuthentication().getUserbyUID(e.uidRemaja!);
          excelItems.add(
              ExcelDataType(data!.name, data.birthDate.second.toString(), e));
        } catch (e) {
          print(('Error: $e'));
          return null;
        }
      } else {
        continue;
      }
    }

    sheet.insertRowIterables([
      const TextCellValue('No'),
      const TextCellValue('Nama'),
      const TextCellValue('Umur'),
      const TextCellValue('Berat Badan'),
      const TextCellValue('Tinggi Badan'),
      const TextCellValue('Lingkar Lengan Atas'),
      const TextCellValue('Lingkar Perut'),
      const TextCellValue('Gula Darah'),
      const TextCellValue('Hemoglobin'),
      const TextCellValue('Kolesterol'),
      const TextCellValue('TDS'),
      const TextCellValue('TDD'),
      const TextCellValue('Status KEK'),
      const TextCellValue('Status Anemia'),
      const TextCellValue('Status Tablet'),
      const TextCellValue('Status Merokok'),
      const TextCellValue('Catatan Dokter'),
    ], 0);

    for (var i = 0; i < items.length; i++) {
      final item = excelItems[i];
      sheet.appendRow([
        IntCellValue(i + 1),
        TextCellValue(item.name),
        TextCellValue(item.age),
        item.data.weight != null ? DoubleCellValue(item.data.weight!) : null,
        item.data.height != null ? DoubleCellValue(item.data.height!) : null,
        item.data.armCircumference != null
            ? DoubleCellValue(item.data.armCircumference!)
            : null,
        item.data.abdominalCircumference != null
            ? DoubleCellValue(item.data.abdominalCircumference!)
            : null,
        item.data.bloodSugar != null
            ? DoubleCellValue(item.data.bloodSugar!)
            : null,
        item.data.hemoglobin != null
            ? DoubleCellValue(item.data.hemoglobin!)
            : null,
        item.data.cholesterol != null
            ? DoubleCellValue(item.data.cholesterol!)
            : null,
        item.data.tds != null ? DoubleCellValue(item.data.tds!) : null,
        item.data.tdd != null ? DoubleCellValue(item.data.tdd!) : null,
        item.data.kek != null
            ? TextCellValue(item.data.kek! == true ? 'Ya' : 'Tidak')
            : null,
        item.data.anemia != null
            ? TextCellValue(item.data.anemia! == true ? 'Ya' : 'Tidak')
            : null,
        item.data.tablet != null
            ? TextCellValue(item.data.tablet! == true ? 'Ya' : 'Tidak')
            : null,
        item.data.smoker != null
            ? TextCellValue(item.data.smoker! == true ? 'Ya' : 'Tidak')
            : null,
        item.data.note != null ? TextCellValue(item.data.note!) : null,
      ]);
    }

    var xlsxBytes = excel.save();
    var siMandjaDirectory = Directory('/storage/emulated/0/Download/SiMandja');

    if (!siMandjaDirectory.existsSync()) {
      siMandjaDirectory.createSync(recursive: true);
    }
    File(join(siMandjaDirectory.path,
        'SiMandja-${items.first!.checkedAt.toString().substring(0, 10)}.xlsx'))
      ..createSync(recursive: true)
      ..writeAsBytesSync(xlsxBytes!);

    return true;
  }
}