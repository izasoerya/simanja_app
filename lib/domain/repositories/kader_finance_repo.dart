import 'package:simanja_app/domain/entities/kader_finance.dart';

abstract class KaderFinanceRepo {
  Future<List<FinanceKader>> getFinances();
  Future<FinanceKader> getFinanceById(String id);

  Future<void> createFinance(FinanceKader finance);
  Future<void> updateFinance(FinanceKader finance);
  Future<void> deleteFinance(FinanceKader finance);
}
