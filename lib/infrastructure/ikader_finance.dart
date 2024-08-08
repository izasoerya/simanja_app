import 'package:simanja_app/domain/entities/kader_finance.dart';
import 'package:simanja_app/domain/repositories/kader_finance_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class KaderFinanceImplementation implements KaderFinanceRepo {
  final Uuid _uuid = const Uuid();
  @override
  Future<FinanceKader?> createFinance(FinanceKader finance) async {
    finance = finance.copyWith(uid: _uuid.v4());
    try {
      final response = await Supabase.instance.client
          .from('kader_finance')
          .insert(finance.toJSON())
          .select()
          .single();
      return FinanceKader.fromJSON(response);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  @override
  Future<void> deleteFinance(FinanceKader finance) {
    // TODO: implement deleteFinance
    throw UnimplementedError();
  }

  @override
  Future<FinanceKader?> getFinanceById(String id) {
    // TODO: implement getFinanceById
    throw UnimplementedError();
  }

  @override
  Future<List<FinanceKader>?> getFinances(String uidPosyandu) async {
    try {
      final response = await Supabase.instance.client
          .from('kader_finance')
          .select()
          .eq('posyandu_uid', uidPosyandu);
      return response.map((e) => FinanceKader.fromJSON(e)).toList();
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  @override
  Future<FinanceKader?> updateFinance(FinanceKader finance) {
    // TODO: implement updateFinance
    throw UnimplementedError();
  }
}
