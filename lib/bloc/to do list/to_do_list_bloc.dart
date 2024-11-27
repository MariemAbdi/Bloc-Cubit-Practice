import 'package:bloc/bloc.dart';
import 'package:state_management_cubit/bloc/to%20do%20list/to_do_list_event.dart';
import 'package:state_management_cubit/models/to_do.dart';

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
}
