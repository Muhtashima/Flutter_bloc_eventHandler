import 'package:flutter_bloc/flutter_bloc.dart';
import 'CounterEvent.dart';
import 'CounterState.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{

  CounterBloc():super(CounterState(0)){
    on<CounterIncrementPressed>((event, emit) => emit(CounterState(state.count+1)),);
    on<CounterDecrementPressed>( (event, emit) => emit(CounterState(state.count-1)), );
    on<CounterResetPressed>((event, emit) => emit(CounterState(0)),);
  }
}