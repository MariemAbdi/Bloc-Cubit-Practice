import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:state_management_cubit/constants.dart';
import 'package:state_management_cubit/models/counter_model.dart';

class CounterCubit extends Cubit<Counter> {
  CounterCubit() : super(const Counter(0, Constants.defaultMessage));

  void increment() {
    if(state.counter < 100){
      emit(Counter(state.counter + 1, Constants.defaultMessage));
    }else{
      emit(Counter(state.counter,Constants.upperLimitMessage));
    }
  }

  void decrement() {
    if(state.counter > 0){
      emit(Counter(state.counter - 1,  Constants.defaultMessage));
    }else{
      emit(Counter(state.counter, Constants.lowerLimitMessage));
    }
  }

  @override
  void onChange(Change<Counter> change) {
    super.onChange(change);
    debugPrint("Counter changed from ${change.currentState} to ${change.nextState}");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    debugPrint('Error in CounterCubit: $error\n$stackTrace');
    super.onError(error, stackTrace);
  }

}