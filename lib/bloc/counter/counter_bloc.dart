import 'package:bloc/bloc.dart';
import 'package:state_management_cubit/config/constants.dart';

import 'counter_state.dart';

///using part + part of instead of import it will be considered a part of this class
///and we don't need to call the event class on its own when we need to use a method
part 'counter_event.dart';

///Event: Input to a bloc (like button press)
///State:
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    ///on event => event: the event that was captured, emit: is updating the state
    on<CounterIncremented>((event, emit){
      if(state.counter==100){
        emit(const CounterState(message: Constants.upperLimitMessage));
        return;
      }
      emit(CounterState(counter: state.counter+1));///state come from the Bloc class
    });
    on<CounterDecremented>((event, emit){
      if(state.counter==0){
        emit(const CounterState(message: Constants.lowerLimitMessage));
        return;
      }
      emit(CounterState(counter: state.counter-1));///state come from the Bloc class
    });
    on<CounterRestarted>((event, emit){
      emit(const CounterState());///state come from the Bloc class
    });
  }
}
