import 'package:alubank/screens/home.dart';
import 'package:alubank/themes/my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Alubank());
}

class Alubank extends StatefulWidget {
  const Alubank({super.key});

  @override
  State<Alubank> createState() => _AlubankState();
}

class _AlubankState extends State<Alubank> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme,
      
      title: "Alubank",
      home: const Home()
    );
  }
}

