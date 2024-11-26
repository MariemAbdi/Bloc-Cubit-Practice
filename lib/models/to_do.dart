import 'package:equatable/equatable.dart';

class ToDo extends Equatable{
  final String id, text;
  final DateTime creationDate;
  final bool isCompleted;

  ToDo({String? id, required this.text, DateTime? creationDate, this.isCompleted = false}):
        id = id ?? DateTime.now().toString(), creationDate = creationDate ?? DateTime.now();

  @override
  List<Object?> get props => [id, text, isCompleted, creationDate];

  ToDo copyWith({
    String? id,
    String? text,
    DateTime? creationDate,
    bool? isCompleted,
  }) {
    return ToDo(
      id: id ?? this.id,
      text: text ?? this.text,
      creationDate: creationDate ?? this.creationDate,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}