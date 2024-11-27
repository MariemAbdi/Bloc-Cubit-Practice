import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:state_management_cubit/bloc/to%20do%20list/to_do_list_event.dart';

import '../../models/to_do.dart';
import 'to_do_list_bloc.dart';

class ToDoListBlocPage extends StatelessWidget {
  const ToDoListBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController controller = TextEditingController();
    final bloc = BlocProvider.of<ToDoListBloc>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text("Bloc To Do List")
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: BlocBuilder<ToDoListBloc, List<ToDo>>(
                    builder: (context, state) {
                      if (state.isEmpty) {
                        return const Center(child: Text("Nothing To Show."));
                      }
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: (){
                                    bloc.add(CompleteAll());
                                  },
                                  child: const Text("Mark All As Completed")
                              ),

                              TextButton(
                                  onPressed: (){
                                    bloc.add(DeleteAll());
                                  },
                                  child: const Text("Delete All", style: TextStyle(color: Colors.redAccent))
                              ),
                            ],
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.length,
                            itemBuilder: (context, index) {
                              ToDo toDo = state[index];
                              return ListTile(
                                title: Text(toDo.text),
                                subtitle: Text(DateFormat.yMEd().add_jms().format(DateTime.now())),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                        value: toDo.isCompleted,
                                        onChanged: (value){
                                          bloc.add(UpdateToDo(toDo: toDo.copyWith(isCompleted: value)));
                                        }
                                    ),
                                    IconButton(
                                        onPressed: (){
                                          bloc.add(DeleteToDo(toDoId: toDo.id));
                                        },
                                        icon: const Icon(Icons.delete, color: Colors.redAccent)
                                    )
                                  ],
                                ),
                              );},
                          ),
                        ],
                      );
                    })
            ),
            Form(
              key: formKey,
              child: TextFormField(
                validator: (task){
                  if(task!.isEmpty){
                    return "Please Type Something First.";
                  }
                  return null;
                },
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Type Here',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      if(formKey.currentState?.validate() ?? false){
                        bloc.add(AddToDo(toDo: ToDo(text: controller.text.trim())));
                        controller.clear();
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

