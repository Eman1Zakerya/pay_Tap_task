import 'package:equatable/equatable.dart';

abstract class ConversionEvent extends Equatable {
  const ConversionEvent();

  @override
  List<Object?> get props => [];
}

class ConvertRequested extends ConversionEvent {
  final String from;
  final String to;
  final double amount;

  const ConvertRequested({required this.from, required this.to, required this.amount});

  @override
  List<Object?> get props => [from, to, amount];
}
