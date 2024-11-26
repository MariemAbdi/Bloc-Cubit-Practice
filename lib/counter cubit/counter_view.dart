import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_cubit/widgets/custom_floating_button.dart';

import 'counter_state.dart';
import 'counter_cubit.dart';

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<CounterCubit>(); // OR final cubit = BlocProvider.of<CounterCubit>(context);
    final cubit = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Cubit Counter"),
        ),
        ///CAN USE THIS AND REMOVE THE BUILDER
        ///final cubit = context.watch<CounterCubit>().state;
        ///cubit.message | cubit.counter
        body: BlocBuilder<CounterCubit, CounterState>(
          //This ensures that the widget rebuilds only when the counter value changes,
          //ignoring changes to other state properties.
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${state.counter}", style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                  if(state.message.isNotEmpty)
                    Text(state.message, style: const TextStyle(fontSize: 18, color: Colors.red), textAlign: TextAlign.center),
                ],
              ),
            );
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomFloatingButton(heroTag: "Increment Counter Cubit", iconData: Icons.plus_one, onPressed: cubit.increment),
            const SizedBox(height: 10),
            CustomFloatingButton(heroTag: "Decrement Counter Cubit", iconData: Icons.exposure_minus_1, onPressed: cubit.decrement),
            const SizedBox(height: 10),
            CustomFloatingButton(heroTag: "Reset Counter Cubit", iconData: Icons.refresh, onPressed: cubit.reset),
          ],
        )
    );
  }
}
