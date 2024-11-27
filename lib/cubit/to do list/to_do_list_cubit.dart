import 'package:bloc/bloc.dart';
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

  deleteAll(){
    emit([]);
  }

  markAllAsCompleted(){
    List<ToDo> updatedList = state.map((todo) => todo.copyWith(isCompleted: true)).toList();
    emit(updatedList);
  }
}
