import 'package:bloc/bloc.dart';
import 'package:state_management_cubit/config/constants.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState());

  void increment() {
    if(state.counter==100){
      emit(const CounterState(message: Constants.upperLimitMessage));
      return;
    }
    emit(CounterState(counter: state.counter+1));///state come from the Bloc class
  }

  void decrement() {
    if(state.counter==0){
      emit(const CounterState(message: Constants.lowerLimitMessage));
      return;
    }
    emit(CounterState(counter: state.counter-1));///state come from the Bloc class
  }

  void reset(){
    emit(const CounterState());
  }
}