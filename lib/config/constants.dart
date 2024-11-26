import 'package:flutter/cupertino.dart';
import 'package:state_management_cubit/models/home_button.dart';
import 'package:state_management_cubit/to%20do%20list/to_do_list_view.dart';

import '../counter bloc/counter_view.dart';
import '../counter cubit/counter_view.dart';


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
        HomeButton(title: "Bloc", widget: Container()),
        HomeButton(title: "Cubit", widget: const ToDoListPage())
      ]
    },
  ];
}
