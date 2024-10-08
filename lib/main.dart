import 'package:counter_app/bloc/CounterBloc.dart';
import 'package:counter_app/bloc/CounterState.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:counter_app/bloc/CounterEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc',
      home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => CounterBloc(),)
          ], 
          child: CounterPage()
      ),
    );
  }


}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {

    // Initialize the Bloc machine here
    final blocMachine = context.read<CounterBloc>();


    return Scaffold(
      appBar: AppBar(title: Text('Event Handling Using Flutter Bloc')),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Stack(
            children: [
              for (int index = 0; index < state.count; index++)
                Positioned(
                    left: Random().nextInt(250).toDouble(),
                    top: Random().nextInt(250).toDouble(),
                    child: Container(
                      color: Colors.transparent,
                      height: 150,
                      width: 150,
                      child: Image.asset('images/img.png',),
                    ))
            ],
          );
        }
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
              blocMachine.add(CounterIncrementPressed());
          }
          ),
          FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: (){
            blocMachine.add(CounterDecrementPressed());
          }),
          FloatingActionButton(
              child: Icon(Icons.exposure_zero),
              onPressed: (){
                blocMachine.add(CounterResetPressed());
              }),
        ],
      ),
    );
  }
}

