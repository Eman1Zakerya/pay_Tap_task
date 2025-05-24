import 'package:equatable/equatable.dart';

class CurrencyConversion extends Equatable{
  final String base;
  final String target;
  final double rate;
  final double amount;
  final double result;

  const CurrencyConversion({
    required this.base,
    required this.target,
    required this.rate,
    required this.amount,
    required this.result,
  });

  @override

  List<Object?> get props => [
    base,
    target,
    rate,
    amount,
    result,
  ];
}

