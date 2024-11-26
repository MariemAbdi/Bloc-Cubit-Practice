import 'package:equatable/equatable.dart';

import '../config/constants.dart';


///By implementing Equatable, Flutter will only trigger UI rebuilds when the state
///properties actually change, preventing unnecessary updates.

class CounterState extends Equatable {
  final int counter;
  final String message;

  const CounterState({this.counter = 0, this.message = Constants.defaultMessage});

  @override
  List<Object> get props => [counter, message];
}