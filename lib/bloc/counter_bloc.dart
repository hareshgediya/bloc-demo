import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementEvent>(_onIncrement);
    on<DecrementEvent>(_onDecrement);
  }

  var _value = 0;

  FutureOr<void> _onIncrement(
    IncrementEvent event,
    Emitter<CounterState> emit,
  ) {
    _value++;
    emit(state.copyWith(value: _value));
  }

  FutureOr<void> _onDecrement(
    DecrementEvent event,
    Emitter<CounterState> emit,
  ) {
    _value--;
    emit(state.copyWith(value: _value));
  }
}
