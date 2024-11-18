import 'package:equatable/equatable.dart';

///By implementing Equatable, Flutter will only trigger UI rebuilds when the state
///properties actually change, preventing unnecessary updates.
class Counter extends Equatable{
  final int counter;
  final String message;

  const Counter(this.counter, this.message);

  @override
  List<Object?> get props => [counter,message];
}