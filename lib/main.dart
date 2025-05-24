// import 'package:conditional_builder_null_safety/example/example.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_taps/presentation/business_logic/bloc/conversion/conversion_bloc.dart';
import 'package:pay_taps/presentation/business_logic/bloc/history/history_bloc.dart';
import 'package:pay_taps/presentation/screens/conversion_screen.dart';
import 'package:pay_taps/presentation/screens/history_screen.dart';

import 'data/data_source/currency_remote_data_source.dart';
import 'data/repositories/currency_repository_implement.dart';
import 'domain/use_case/convert_currency.dart';
import 'domain/use_case/get_historical_data.dart';

void main() {
  final dio = Dio();
  final remoteDataSource = CurrencyRemoteDataSource(dio);
  final repository = CurrencyRepositoryImpl(remoteDataSource);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ConversionBloc(ConvertCurrency(repository))),
        BlocProvider(create: (_) => HistoryBloc(GetHistoryRates(repository))),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,

        theme:ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        ), //getThemeDataDark(),
        home:const ConverterScreen()//MainMoviesScreen() ,
    );
  }
}
