import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/use_case/convert_currency.dart';
import 'conversion_event.dart';
import 'conversion_state.dart';

class ConversionBloc extends Bloc<ConversionEvent, ConversionState> {
  final ConvertCurrency convertCurrency;

  ConversionBloc(this.convertCurrency) : super(ConversionInitial()) {
    on<ConvertRequested>((event, emit) async {
      emit(ConversionLoading());
      try {
        final conversion = await convertCurrency(
          from: event.from,
          to: event.to,
          amount: event.amount,
        );
        emit(ConversionLoaded(conversion));
      } catch (e) {
        emit(ConversionError('Failed to convert: ${e.toString()}'));
      }
    });
  }
}
