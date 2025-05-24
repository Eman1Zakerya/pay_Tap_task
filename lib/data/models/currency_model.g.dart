// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyResponseModel _$CurrencyResponseModelFromJson(
  Map<String, dynamic> json,
) => CurrencyResponseModel(
  base: json['base'] as String,
  date: json['date'] as String,
  rates: (json['rates'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  timestamp: (json['timestamp'] as num?)?.toInt(),
);

Map<String, dynamic> _$CurrencyResponseModelToJson(
  CurrencyResponseModel instance,
) => <String, dynamic>{
  'base': instance.base,
  'date': instance.date,
  'rates': instance.rates,
  'timestamp': instance.timestamp,
};
