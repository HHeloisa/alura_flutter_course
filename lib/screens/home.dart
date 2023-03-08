import 'package:flutter/material.dart';
import 'package:task_project/components/taskcard.dart';
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
          children: const [
            TaskCard(
              text: "Finalizar curso de flutter da Alura",
              difficulty: 1,
            ),
            TaskCard(
              text: "Finalizar instalação do Android Studio",
              difficulty: 5,
            ),
            TaskCard(text: "Finalizar instalação do Flutter", difficulty: 4),
            TaskCard(
              text: "Finalizar curso de flutter da Udemy",
              difficulty: 9,
            ),
            TaskCard(
                text: "Finalizar instalação do Android Studio", difficulty: 7),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FormScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
