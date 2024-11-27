import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_cubit/config/styling.dart';
import 'package:state_management_cubit/to%20do%20list%20bloc/to_do_list_bloc.dart';
import 'package:state_management_cubit/to%20do%20list%20cubit/to_do_list_cubit.dart';
import 'package:state_management_cubit/views/home_page.dart';

import 'counter bloc/counter_bloc.dart';
import 'counter cubit/counter_cubit.dart';


void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
            create: (context) => ToDoListCubit()
        ),
        BlocProvider(
            create: (context) => ToDoListBloc()
        ),
      ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit Counter',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const HomePage(),
    );
  }
}
