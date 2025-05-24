import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/use_case/get_historical_data.dart';
import 'history_event.dart';
import 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetHistoryRates getHistoryRates;

  HistoryBloc(this.getHistoryRates) : super(HistoryInitial()) {
    on<FetchHistory>((event, emit) async {
      emit(HistoryLoading());
      try {
        final history = await getHistoryRates(
          from: event.from,
          to: event.to,
          amount: event.amount,
          dates: event.lastNDates,
        );
        emit(HistoryLoaded(history));
      } catch (e) {
        emit(HistoryError('Failed to fetch history: ${e.toString()}'));
      }
    });
  }
}
