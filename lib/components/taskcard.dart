import 'package:flutter/material.dart';
import 'package:task_project/data/task_dao.dart';

import '../constants.dart';
import 'difficulty.dart';

// ignore: must_be_immutable
class TaskCard extends StatefulWidget {
  TaskCard(
      {super.key, required this.name, required this.difficulty, this.image});

  final String name;
  final int difficulty;
  final String? image;
  int nivel = 0;
  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        Container(
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.blue,
          ),
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black26,
                      ),
                      width: 80,
                      height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                              imageByLevel(widget.nivel, widget.image),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(widget.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  overflow: TextOverflow.fade,
                                ))),
                        Difficulty(
                          difficultyLevel: widget.difficulty,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                          onLongPress: TaskDao().delete(widget.name),
                          onPressed: () {
                            setState(() {
                              widget.nivel++;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'up',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          )),
                    )
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: widget.difficulty > 0
                            ? (widget.nivel / widget.difficulty) / 10
                            : 1,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text('Nível: ${widget.nivel}'),
                )
              ],
            )
          ],
        ),
      ]),
    );
  }
}

// Inves de seguir o tutorial, que passa imagem por parametro da mesma forma que o nome
// criei uma função que retorna uma imagem diferente de acordo com o nivel da tarefa.
// também diferente do tutorial, coloquei as imagens como opcionais, se o usuario colocar
// eu aplico ela, do contrario, mantenho a logica anterior, de imageByLevel.
String imageByLevel(level, image) {
  
  if (image != null && image.isNotEmpty) {
    return image;
  } else if (level < 5) {
    return charmander;
  } else if (level < 12) {
    return charmeleon;
  } else {
    return charizard;
  }
}
