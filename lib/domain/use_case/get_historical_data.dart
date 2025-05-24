import '../entities/currency.dart';
import '../repositories/currency_repository.dart';

class GetHistoryRates {
  final CurrencyRepository repository;

  GetHistoryRates(this.repository);

  Future<List<CurrencyConversion>> call({
    required String from,
    required String to,
    required double amount,
    required List<String> dates,
  }) {
    return repository.getConversionHistory(
      from: from,
      to: to,
      amount: amount,
      lastNDates: dates,
    );
  }
}
