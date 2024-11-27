import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:state_management_cubit/models/to_do.dart';
import 'package:state_management_cubit/to%20do%20list%20bloc/to_do_list_event.dart';

class ToDoListBloc extends Bloc<ToDoListEvent, List<ToDo>> {
  ToDoListBloc() : super([]){
    on<AddToDo>((event, emit){
      emit( [...state, event.toDo]);
    });
    on<UpdateToDo>((event, emit){
      List<ToDo> updatedList = state.map((todo) => todo.id == event.toDo.id ? event.toDo : todo).toList();
      emit(updatedList);
    });
    on<DeleteToDo>((event, emit){
      List<ToDo> updatedList = state.where((todo) => todo.id != event.toDoId).toList();
      emit(updatedList);
    });
    on<DeleteAll>((event, emit){
     emit([]);
    });
    on<CompleteAll>((event, emit){
      List<ToDo> updatedList = state.map((todo) => todo.copyWith(isCompleted: true)).toList();
      emit(updatedList);
    });
  }

  @override
  void onChange(Change<List<ToDo>> change) {
    super.onChange(change);
    Logger().d("To Do List changed from ${change.currentState} to ${change.nextState}");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    Logger().e('Error in To Do List Cubit: $error\n$stackTrace');
    super.onError(error, stackTrace);
  }
}
