import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

///using part + part of instead of import it will be considered a part of this class
///and we don't need to call the event class on its own when we need to use a method
part 'counter_event.dart';

///Event: Input to a bloc (like button press)
///State:
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    ///on event => event: the event that was captured, emit: is updating the state
    on<CounterIncremented>((event, emit){
      emit(state+1);///state come from the Bloc class
    });
    on<CounterDecremented>((event, emit){
      if(state==0){
        return;
      }
      emit(state-1);///state come from the Bloc class
    });
  }
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    debugPrint("Counter changed from ${change.currentState} to ${change.nextState}");
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    debugPrint('Error in CounterCubit: $error\n$stackTrace');
    super.onError(error, stackTrace);
  }
}
