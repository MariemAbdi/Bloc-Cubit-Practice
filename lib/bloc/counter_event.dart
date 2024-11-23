part of 'counter_bloc.dart';
///Naming convention of events : bloc name + method
///sealed instead of abstract:
sealed class CounterEvent{}
final class CounterIncremented extends CounterEvent{}
final class CounterDecremented extends CounterEvent{}
final class CounterRestarted extends CounterEvent{}