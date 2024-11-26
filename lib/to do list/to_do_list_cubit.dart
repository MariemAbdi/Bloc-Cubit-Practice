import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:state_management_cubit/models/to_do.dart';

//Cubit Example With Model And No State
class ToDoListCubit extends Cubit<List<ToDo>> {
  ToDoListCubit() : super(const []);

  addToList(ToDo toDo){
    emit( [...state, toDo]);
  }

  updateToDo(ToDo toDo){
    List<ToDo> updatedList = state.map((todo) => todo.id == toDo.id ? toDo : todo).toList();
    emit(updatedList);
  }

  deleteToDo(String toDoId){
    List<ToDo> updatedList = state.where((todo) => todo.id != toDoId).toList();
    emit(updatedList);
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
