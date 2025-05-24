import '../entities/currency.dart';
import '../repositories/currency_repository.dart';

class ConvertCurrency {
  final CurrencyRepository repository;

  ConvertCurrency(this.repository);

  Future<CurrencyConversion> call({
    required String from,
    required String to,
    required double amount,
  }) {
    return repository.convertCurrency(
      from: from,
      to: to,
      amount: amount,
    );
  }
}
