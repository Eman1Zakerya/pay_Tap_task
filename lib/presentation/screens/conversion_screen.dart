import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business_logic/bloc/conversion/conversion_bloc.dart';
import '../business_logic/bloc/conversion/conversion_event.dart';
import '../business_logic/bloc/conversion/conversion_state.dart';
import '../widgets/custom_button.dart';
import 'history_screen.dart';


class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  String from = 'EUR';
  String to = 'USD';
  double amount = 3.0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Exchange"),
        centerTitle: false,
        actions: [Icon(Icons.refresh)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  height: 60,
                  width:150 ,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white24)
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(

                      value: from,
                      items: ['EUR', 'USD', 'EGP', 'SAR'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                      onChanged: (val) => setState(() => from = val!),
                    ),
                  ),
                ),
                SizedBox(width: 30,),
                SizedBox(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '1.0',
                      labelText: 'amount',
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      focusedBorder:
                          OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color:Colors.purple ,
                            ),
                          ),
                      enabledBorder:
                          OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color:Colors.white24 ,
                            ),
                          ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          // color: AppColors.red, width: 1.3
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      ),




                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      setState(() {
                        amount = double.tryParse(val) ?? 1.0;
                      });
                    },
                  ),
                ),


              ],
            ),

            SizedBox(height: 20,),
            
            Center(
              child: Icon(Icons.assignment_returned_rounded,color: Colors.purple,),
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  height: 60,
                  width:150 ,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white24)
                  ),
                  child: DropdownButtonHideUnderline(
                  child:  DropdownButton<String>(
                      value: to,
                      items: ['EUR', 'USD', 'EGP', 'SAR'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                      onChanged: (val) => setState(() => to = val!),
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Expanded(
                  child: Container(
                    // padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                    height: 70,
                    width:150 ,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white24)
                    ),
                    child: Center(
                      child: BlocBuilder<ConversionBloc, ConversionState>(
                        builder: (context, state) {
                          if (state is ConversionLoading) {
                            return const CircularProgressIndicator();
                          } else if (state is ConversionLoaded) {
                            return Text(
                              " ${state.conversion.result.toStringAsFixed(2)} ",
                              style: const TextStyle(fontSize: 16, ),
                            );
                          } else if (state is ConversionError ) {
                            return  Container(

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
                                      'something went wrong please try again or try connect to the internet',

                                      style: const TextStyle(color: Colors.yellow),
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
                  ),
                )
              ],
            ),

            SizedBox(height: 20,),
            CustomButton(
              onPressed: () {
                context.read<ConversionBloc>().add(ConvertRequested(from: from, to: to, amount: amount));
              },
              text: "Calculate",
            ),
            const SizedBox(height: 20),

            CustomButton(
              text: 'view history',
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) =>  HistoryScreen ()));
              },),


          ],
        ),
      ),
    );
  }
}









