import '../../domain/entities/currency.dart';
import '../../domain/repositories/currency_repository.dart';
import '../data_source/currency_remote_data_source.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyRemoteDataSource remoteDataSource;

  CurrencyRepositoryImpl(this.remoteDataSource);

  @override
  Future<CurrencyConversion> convertCurrency({
    required String from,
    required String to,
    required double amount,
  }) async {
    final response = await remoteDataSource.getLatestRates(base: from, symbols: [to]);
    final rate = response.rates[to]!;


    if (rate == null) {
      throw Exception("Currency rate not found for $to");
    }

    return CurrencyConversion(
      base: from,
      target: to,
      rate: rate,
      amount: amount,
      result: amount * rate,
    );
  }

  @override
  Future<List<CurrencyConversion>> getConversionHistory({
    required String from,
    required String to,
    required double amount,
    required List<String> lastNDates,
  }) async {
    final List<CurrencyConversion> history = [];

    for (final date in lastNDates) {
      final response = await remoteDataSource.getHistoricalRate(
        date: date,
        base: from,
        symbols: [to],
      );
      final rate = response.rates[to]!;

      history.add(CurrencyConversion(
        base: from,
        target: to,
        rate: rate,
        amount: amount,
        result: amount * rate,
      ));
    }

    return history;
  }
}





