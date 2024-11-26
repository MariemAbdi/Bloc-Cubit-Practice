import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_floating_button.dart';
import 'counter_bloc.dart';
import 'counter_state.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final bloc = context.read<CounterBloc>(); OR final bloc = BlocProvider.of<CounterBloc>(context);
    final bloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bloc Counter"),
        ),
        ///CAN USE THIS AND REMOVE THE BUILDER
        ///final bloc = context.watch<CounterBloc>().state;
        ///bloc.message | bloc.counter
        body: BlocBuilder<CounterBloc, CounterState>(
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
            CustomFloatingButton(
                heroTag: "Increment Counter Bloc",
                iconData: Icons.plus_one,
                onPressed: ()=>bloc.add(CounterIncremented())
            ),
            const SizedBox(height: 10),
            CustomFloatingButton(
                heroTag: "Decrement Counter Bloc",
                iconData: Icons.exposure_minus_1,
                onPressed: ()=>bloc.add(CounterDecremented())
            ),
            const SizedBox(height: 10),
            CustomFloatingButton(
                heroTag: "Reset Counter Bloc",
                iconData: Icons.refresh,
                onPressed: ()=>bloc.add(CounterRestarted())
            ),
          ],
        )
    );
  }
}

