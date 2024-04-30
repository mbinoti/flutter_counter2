// definição dos eventos que o contador pode receber

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class Increment extends CounterEvent {}

// definicao dos estados que o contador pode assumir
abstract class CounterState {}

class CounterValue extends CounterState {
  final int value;
  CounterValue(this.value);
}

// implementacao do bloc.
// O bloc é um gerenciador de estado que recebe eventos e emite estados

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterValue(0)) {
    on<Increment>(_onIncrement);
  }

  void _onIncrement(Increment event, Emitter<CounterState> emit) {
    final currentState = state;
    if (currentState is CounterValue) {
      emit(CounterValue(currentState.value + 1));
    }
  }
}
