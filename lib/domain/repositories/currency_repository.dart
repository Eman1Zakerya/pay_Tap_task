
import '../entities/currency.dart';

abstract class CurrencyRepository {
  Future<CurrencyConversion> convertCurrency({
    required String from,
    required String to,
    required double amount,
  });

  Future<List<CurrencyConversion>> getConversionHistory({
    required String from,
    required String to,
    required double amount,
    required List<String> lastNDates,
  });
}
