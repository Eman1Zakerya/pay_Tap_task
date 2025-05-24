import 'dart:convert';

import 'package:dio/dio.dart';
import '../../core/errors/exceptions.dart';
import '../../core/network/api_constant.dart';
import '../../core/network/error_message_model.dart';
import '../models/currency_model.dart';

class CurrencyRemoteDataSource {
  final Dio dio;

  CurrencyRemoteDataSource(this.dio);


  Future<CurrencyResponseModel> getLatestRates({
    required String base,
    required List<String> symbols,
  }) async {
    final response = await dio.get(
      ApiConstance.latest,
      queryParameters: {
        'access_key':ApiConstance.apiKey,
        'symbols': symbols.join(','),
      },
    );

    final data = response.data;

    if (data['success'] != true) {
      throw ServerException( errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

    if (!data.containsKey('rates')) {
      throw Exception("Missing 'rates' in response");
    }

    return CurrencyResponseModel.fromJson(data);
  }




  Future<CurrencyResponseModel> getHistoricalRate({
    required String date,
    required String base,
    required List<String> symbols,
  }) async {
    final response = await dio.get(
       '${ApiConstance.baseUrl}/2025-05-17',
    //  'https://data.fixer.io/api/$date',
      queryParameters: {
        'access_key': ApiConstance.apiKey,
        'base':'EUR',
        'symbols': symbols.join(','),
      },
    );
    // print('Fixer raw response: ${response.data}');

    final data = response.data;



    if (data['success'] != true) {
      final error = data['error'];
      if (error != null && error['type'] == 'rate_limit_reached') {
        throw Exception("  limit reached. Try again later or upgrade your plan.");
      }
       throw ServerException( errorMessageModel: ErrorMessageModel.fromJson(response.data));

    }

    if (!data.containsKey('rates')) {
      throw Exception("Missing 'rates' in response: $data");
    }

    return CurrencyResponseModel.fromJson(data);
  }

}


