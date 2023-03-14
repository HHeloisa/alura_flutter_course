import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

// os componentes nativos do flutter, como container, não tem thema pre definido, widgets do material tem

ThemeData myTheme = ThemeData(
    primaryColor: ThemeColors.primaryColor,
    // importante usar os dois (primary color e colorScheme, pq os widgets podem erdar de propriedades diferentes
    colorScheme: ColorScheme.fromSwatch(
      //  para acessar as cores do ColorScheme: Theme.of(context).colorScheme.surface
      primarySwatch:
          ThemeColors.primaryColor, //swatch contem o esquema de cores[varições]
    ).copyWith( //copyWith dá acesso a novas propriedade, e também cria a cor secundária, alguns widgets referenciam-se aqui
        brightness: Brightness
            .dark, //com esta propriedade se define o ~modo. se não for definido assume o light //reload necessario
        secondary: Color.fromARGB(255, 43, 203, 187),
        surface: Color.fromARGB(255, 43, 203, 187)),
    fontFamily: 'Raleway',
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 10),
      bodyMedium: TextStyle(
          fontSize:
              16), // Esta propriedade é usada por default, assim, qlq texto tem tamanho 16
      bodyLarge: TextStyle(
        fontSize: 28, fontWeight: FontWeight.bold,
        // Exemplo de como usar pq nao é default: TextSpan(text: "1000,00", style: Theme.of(context).textTheme.bodyLarge
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
    ));
