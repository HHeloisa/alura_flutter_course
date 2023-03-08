import 'package:flutter/material.dart';
import 'package:task_project/data/task_inherited.dart';
import 'package:task_project/screens/form_screen.dart';

import '../constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        leading: Container(),
      ),
      body: Container(
        color: Colors.pinkAccent[100],
        child: ListView(
          children: TaskInherited.of(context).taskList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (contextNew) => FormScreen(
                        taskContext: context,
                      )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
