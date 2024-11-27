import 'package:equatable/equatable.dart';
import 'package:state_management_cubit/models/to_do.dart';

sealed class ToDoListEvent extends Equatable{}

class AddToDo extends ToDoListEvent {
  final ToDo toDo;
  AddToDo({
    required this.toDo,
  });

  @override
  List<Object?> get props => [toDo];
}
class UpdateToDo extends ToDoListEvent {
  final ToDo toDo;

  UpdateToDo({
    required this.toDo,
  });

  @override
  List<Object?> get props => [toDo];
}
class DeleteToDo extends ToDoListEvent {
  final String toDoId;
  DeleteToDo({
    required this.toDoId,
  });

  @override
  List<Object?> get props => [toDoId];  
}
class DeleteAll extends ToDoListEvent {
  @override
  List<Object?> get props => const[];
}
class CompleteAll extends ToDoListEvent {
  @override
  List<Object?> get props => const[];
}