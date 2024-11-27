import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_cubit/bloc/auth/auth_bloc.dart';
import 'package:state_management_cubit/bloc_observer.dart';
import 'package:state_management_cubit/config/styling.dart';
import 'package:state_management_cubit/views/home_page.dart';

import 'bloc/counter/counter_bloc.dart';
import 'bloc/to do list/to_do_list_bloc.dart';
import 'cubit/counter/counter_cubit.dart';
import 'cubit/to do list/to_do_list_cubit.dart';


void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
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
        BlocProvider(
            create: (context) => AuthBloc()
        ),
      ],
      child: MaterialApp(
        title: 'Cubit Counter',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const HomePage(),
      ),
    );
  }
}
