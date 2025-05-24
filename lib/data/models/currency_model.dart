import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

// @JsonSerializable()
// class CurrencyResponseModel {
//   final String base;
//   final String date;
//   final Map<String, double> rates;
//
//   CurrencyResponseModel({
//     required this.base,
//     required this.date,
//     required this.rates,
//   });
//
//   factory CurrencyResponseModel.fromJson(Map<String, dynamic> json) =>
//       _$CurrencyResponseModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$CurrencyResponseModelToJson(this);
// }




@JsonSerializable()
class CurrencyResponseModel {
  final String base;
  final String date;
  final Map<String, double> rates;
  final int? timestamp;

  CurrencyResponseModel({
    required this.base,
    required this.date,
    required this.rates,
    this.timestamp,
  });

  factory CurrencyResponseModel.fromJson(Map<String, dynamic> json) {
    final rawRates = json['rates'] as Map<String, dynamic>?;
    if (rawRates == null) {
      throw Exception("Missing 'rates' in response");
    }

    return CurrencyResponseModel(
      base: json['base'] as String,
      date: json['date'] as String,
      rates: rawRates.map((k, v) => MapEntry(k, (v as num).toDouble())),
      timestamp: json['timestamp'] is int ? json['timestamp'] as int : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'base': base,
    'date': date,
    'rates': rates,
    'timestamp': timestamp,
  };
}


