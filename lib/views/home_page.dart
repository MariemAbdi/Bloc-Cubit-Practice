import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit_state.dart';
import '../models/counter_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CounterCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Counter"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<CounterCubit, Counter>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.text, style: const TextStyle(fontSize: 18, color: Colors.red)),
                const SizedBox(height: 20),
                Text("${state.counter}", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(//add increase
            onPressed: () => cubit.increment(),
            child: const Icon(Icons.plus_one),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(//add increase
            onPressed: () => cubit.decrement(),
            child: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
    );
  }
}
