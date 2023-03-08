import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  const Difficulty({
    Key? key, required this.difficultyLevel
  }) : super(key: key);

final int difficultyLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,
            size: 15,
            color: difficultyLevel > 0
                ? Colors.blue
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: difficultyLevel >= 4
                ? Colors.blue
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: difficultyLevel > 5
                ? Colors.blue
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: difficultyLevel > 6
                ? Colors.blue
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: difficultyLevel > 8
                ? Colors.blue
                : Colors.blue[100]),
      ],
    );
  }
}
