part of 'counter_bloc.dart';
///Naming convention of events : bloc name + method

///A sealed class restricts where it can be subclassed,
///ensuring that all possible subclasses are defined within the same library or file.
sealed class CounterEvent{}
final class CounterIncremented extends CounterEvent{}
final class CounterDecremented extends CounterEvent{}
final class CounterRestarted extends CounterEvent{}