import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

ThemeData MyTheme = ThemeData(
  primarySwatch: ThemeColors.primaryColor, //swatch contem o esquema de cores[varições]
  primaryColor: ThemeColors.primaryColor,
  // importante usar os dois pq os widgets podem erdar de propriedades diferentes
  brightness: Brightness.dark, //com esta propriedade se define o ~modo. se não for definido assume o light //reload necessario
    fontFamily: 'Raleway',
  textTheme: const TextTheme(
    bodySmall: TextStyle(fontSize: 10),
    bodyMedium:  TextStyle(fontSize: 16), // Esta propriedade é usada por default, assim, qlq texto tem tamanho 16
    bodyLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,
    // Exemplo de como usar pq nao é default: TextSpan(text: "1000,00", style: Theme.of(context).textTheme.bodyLarge
    ),
    titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.normal,
  ),
));