import 'package:state_management_cubit/models/home_button.dart';

import '../bloc/auth/auth_view.dart';
import '../bloc/counter/counter_view.dart';
import '../bloc/to do list/to_do_list_view.dart';
import '../cubit/counter/counter_view.dart';
import '../cubit/to do list/to_do_list_view.dart';


class Constants{
  static const String defaultMessage = "";
  static const String upperLimitMessage = "Can't Go Above 100";
  static const String lowerLimitMessage = "Can't Be Less Than 0";

  static final pages = [
    {
      "Counter": [
        HomeButton(title: "Bloc", widget: const CounterBlocPage()),
        HomeButton(title: "Cubit", widget: const CounterCubitPage())
      ]
    },
    {
      "To Do List": [
        HomeButton(title: "Bloc", widget: const ToDoListBlocPage()),
        HomeButton(title: "Cubit", widget: const ToDoListCubitPage())
      ]
    },
    {
      "Auth": [
        HomeButton(title: "Bloc", widget: const AuthPageBloc()),
        //HomeButton(title: "Cubit", widget: const ToDoListCubitPage())
      ]
    },
  ];
}
