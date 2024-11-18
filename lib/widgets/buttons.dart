import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_cubit/cubit/counter_cubit_state.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CounterCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: cubit.increment,
          child: const Icon(Icons.plus_one),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          onPressed: cubit.decrement,
          child: const Icon(Icons.exposure_minus_1),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          onPressed: cubit.reset,
          child: const Icon(Icons.refresh),
        ),
      ],
    );
  }
}
