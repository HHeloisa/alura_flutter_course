import 'package:flutter/material.dart';
import 'package:task_project/constants.dart';
import 'package:task_project/data/task_inherited.dart';
import 'package:task_project/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // o TaskInherited precisa ser o mais alto na arvore, entao todo acessam ele
      home: TaskInherited(child: const Home()),
    );
  }
}



