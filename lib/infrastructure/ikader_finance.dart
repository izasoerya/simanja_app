import 'package:simanja_app/domain/entities/kader_finance.dart';
import 'package:simanja_app/domain/repositories/kader_finance_repo.dart';

class KaderFinanceImplementation implements KaderFinanceRepo {
  @override
  Future<void> createFinance(FinanceKader finance) {
    // TODO: implement createFinance
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFinance(FinanceKader finance) {
    // TODO: implement deleteFinance
    throw UnimplementedError();
  }

  @override
  Future<FinanceKader> getFinanceById(String id) {
    // TODO: implement getFinanceById
    throw UnimplementedError();
  }

  @override
  Future<List<FinanceKader>> getFinances() {
    // TODO: implement getFinances
    throw UnimplementedError();
  }

  @override
  Future<void> updateFinance(FinanceKader finance) {
    // TODO: implement updateFinance
    throw UnimplementedError();
  }
}
