import 'package:flutter/material.dart';
import 'package:state_management_cubit/widgets/buttons.dart';
import 'package:state_management_cubit/widgets/counter_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Counter", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const CounterWidget(),
      floatingActionButton: const Buttons(),
    );
  }
}
