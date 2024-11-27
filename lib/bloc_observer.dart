import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

///An interface for observing the behavior of Bloc instances.
class AppBlocObserver extends BlocObserver{
  ///We can run something, when we create our Bloc
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint("${bloc.runtimeType} created! ${bloc.state}");
    ///We can check, if the BlocBase is a Bloc or a Cubit
    if (bloc is Cubit) {
      debugPrint("This is a Cubit");
    } else {
      debugPrint("This is a Bloc");
    }
  }

  ///We can react to events
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    Logger().i("An event Happened in $bloc the event is $event");
  }

  ///We can react to transitions which is similar to onChange but tells you which event triggered/caused the change
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    /// With this we can specifically know, when and what changed in our Bloc
    Logger().t("There was a transition from ${transition.currentState} to ${transition.nextState}");
  }

  ///We can react to changes showing the previous and current state
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Logger().d("${bloc.runtimeType} changed from ${change.currentState} to ${change.nextState}");
  }

  ///We can react to errors, and we will know the error and the StackTrace
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Logger().e('Error in ${bloc.runtimeType}: $error\n$stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  ///We can even run something, when we close our Bloc
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    Logger().w("BLOC is closed");
  }
}