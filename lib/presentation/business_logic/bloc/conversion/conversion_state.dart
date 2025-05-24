import 'package:equatable/equatable.dart';

import '../../../../domain/entities/currency.dart';

abstract class ConversionState extends Equatable {
  const ConversionState();

  @override
  List<Object?> get props => [];
}

class ConversionInitial extends ConversionState {}

class ConversionLoading extends ConversionState {}

class ConversionLoaded extends ConversionState {
  final CurrencyConversion conversion;

  const ConversionLoaded(this.conversion);

  @override
  List<Object?> get props => [conversion];
}

class ConversionError extends ConversionState {
  final String message;

  const ConversionError(this.message);

  @override
  List<Object?> get props => [message];
}
