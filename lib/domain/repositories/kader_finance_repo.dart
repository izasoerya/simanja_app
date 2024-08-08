import 'package:simanja_app/domain/entities/kader_finance.dart';

abstract class KaderFinanceRepo {
  Future<List<FinanceKader>?> getFinances(String uidPosyandu);
  Future<FinanceKader?> getFinanceById(String id);

  Future<FinanceKader?> createFinance(FinanceKader finance);
  Future<FinanceKader?> updateFinance(FinanceKader finance);
  Future<void> deleteFinance(FinanceKader finance);
}
