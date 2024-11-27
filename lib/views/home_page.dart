import 'package:flutter/material.dart';
import 'package:state_management_cubit/config/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit & Bloc"),
      ),
      body: ListView.builder(
          itemCount: Constants.pages.length,
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index){
            final category = Constants.pages[index].keys.first; // Category title
            final buttons = Constants.pages[index][category]!; // List of buttons

            return Column(
              children: buttons.map((button) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Text("$category ${button.title}", style: const TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                    tileColor: Theme.of(context).primaryColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => button.widget),
                      );
                    },
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
