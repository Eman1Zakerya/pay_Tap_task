import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business_logic/bloc/history/history_bloc.dart';
import '../business_logic/bloc/history/history_event.dart';
import '../business_logic/bloc/history/history_state.dart';
import '../widgets/custom_history_item.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String from = 'EUR';
  String to = 'USD';
  double amount = 1.0;

  @override
  void initState() {
    super.initState();
    _fetchHistory();
  }

  void _fetchHistory() {
    final today = DateTime.now();
    final last4Dates = List.generate(
      4,
          (i) => today.subtract(Duration(days: i + 1)),
    ).map((d) => d.toIso8601String().split('T').first).toList();

    context.read<HistoryBloc>().add(FetchHistory(
      from: from,
      to: to,
      amount: amount,
      lastNDates: last4Dates,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
          title: const Text("Exchange History")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            if (state is HistoryLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            else if (state is HistoryLoaded) {

              return ListView.separated(
                itemCount:state.history.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                   final record = state.history[index];
                  return CustomHistoryItem(
                    title:
                      "${record.amount}     ${record.base} →  ${record.target}   ${record.result.toStringAsFixed(2)}",
                    subTitle: "Rate: ${record.rate.toStringAsFixed(4)}"//

                  );
                },
              );
             }

            else if (state is HistoryError) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: ListView.separated(
                        itemCount:3, //state.history.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, index) {
                          return CustomHistoryItem(
                            title:
                              "Time: 2025-01  16:27:01",
                            subTitle: "50.51          EGP  → USD          1.00",//

                          );
                        },
                      ),
                    ),
                    Text('Oopsy', style: TextStyle(fontSize: 20,
                        fontWeight:FontWeight.bold,color: Colors.blueAccent ),),
                    SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.error, color: Colors.blueAccent),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                             state.message ,
                              style: const TextStyle(color: Colors.yellow),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

             return const SizedBox();
          },
        ),
      ),
    );
  }
}




