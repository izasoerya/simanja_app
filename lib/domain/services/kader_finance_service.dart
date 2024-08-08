import 'package:simanja_app/domain/entities/kader_finance.dart';
import 'package:simanja_app/infrastructure/ikader_finance.dart';

class KaderFinanceService {
  Future<FinanceKader?> createFinance(FinanceKader finance) async {
    final response = await KaderFinanceImplementation().createFinance(finance);
    return response;
  }

  Future<List<FinanceKader>?> getListFinance(String idKader) async {
    final response = await KaderFinanceImplementation().getFinances(idKader);
    return response;
  }
}
