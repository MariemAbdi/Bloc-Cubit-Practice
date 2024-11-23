import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_cubit/bloc/counter_bloc.dart';

import '../cubit/counter_cubit.dart';
import '../cubit/counter_state.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///CAN USE THIS AND REMOVE THE BUILDER
    ///final cubit = context.watch<CounterCubit>().state;
    ///cubit.message | cubit.counter
    return BlocBuilder<CounterBloc, int>(
      //This ensures that the widget rebuilds only when the counter value changes,
      //ignoring changes to other state properties.
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$state", style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              // if(state.message.isNotEmpty)
              //   Text(state.message, style: const TextStyle(fontSize: 18, color: Colors.red), textAlign: TextAlign.center),
            ],
          ),
        );
      },
    );
    // return BlocBuilder<CounterCubit, CounterState>(
    //   //This ensures that the widget rebuilds only when the counter value changes,
    //   //ignoring changes to other state properties.
    //   buildWhen: (previous, current) => previous != current,
    //   builder: (context, state) {
    //     return Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text("${state.counter}", style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
    //           if(state.message.isNotEmpty)
    //             Text(state.message, style: const TextStyle(fontSize: 18, color: Colors.red), textAlign: TextAlign.center),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
