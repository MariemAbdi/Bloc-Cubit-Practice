import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:state_management_cubit/constants.dart';
import 'package:state_management_cubit/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState());

  void increment() {
    if (state.counter < 100) {
      emit(CounterState(counter: state.counter + 1, message: Constants.defaultMessage));
    } else {
      emit(CounterState(counter: state.counter, message: Constants.upperLimitMessage));
    }
  }

  void decrement() {
    if (state.counter > 0) {
      emit(CounterState(counter: state.counter - 1, message: Constants.defaultMessage));
    } else {
      emit(CounterState(counter: state.counter, message: Constants.lowerLimitMessage));
    }
  }

  void reset(){
    emit(const CounterState());
  }
  @override
  void onChange(Change<CounterState> change) {
    super.onChange(change);
    debugPrint("Counter changed from ${change.currentState.props[0]} to ${change.nextState.props[0]}");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    debugPrint('Error in CounterCubit: $error\n$stackTrace');
    super.onError(error, stackTrace);
  }

}