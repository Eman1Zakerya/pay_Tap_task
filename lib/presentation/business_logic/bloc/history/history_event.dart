import 'package:equatable/equatable.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object?> get props => [];
}

class FetchHistory extends HistoryEvent {
  final String from;
  final String to;
  final double amount;
  final List<String> lastNDates;

  const FetchHistory({
    required this.from,
    required this.to,
    required this.amount,
    required this.lastNDates,
  });

  @override
  List<Object?> get props => [from, to, amount, lastNDates];
}
