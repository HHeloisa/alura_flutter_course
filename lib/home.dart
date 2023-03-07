import 'package:flutter/material.dart';
import 'package:task_project/taskcard.dart';

import 'constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        leading: Container(),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: AnimatedOpacity(
          opacity: opacidade == true ? 1 : 0,
          duration: const Duration(milliseconds: 800),
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
                  text: "Finalizar instalação do Android Studio",
                  difficulty: 7),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}