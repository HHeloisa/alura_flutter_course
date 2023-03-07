
import 'package:flutter/material.dart';

import 'constants.dart';
import 'difficulty.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.text, required this.difficulty});

  final String text;
  final int difficulty;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {

  //colocar as variaevis pra cima do override se seus valores nao devem ser perdidos ao remontar a tela por uma atualização de widget
  int nivel = 0;
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
                          child: Image.network(imageByLevel(nivel),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(widget.text,
                                style: const TextStyle(
                                  fontSize: 18,
                                  overflow: TextOverflow.fade,
                                ))),
                        Difficulty(difficultyLevel: widget.difficulty,)
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
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
                            ? (nivel / widget.difficulty) / 10
                            : 1,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text('Nível: $nivel'),
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
imageByLevel(level) {
  if (level < 5) {
    return charmander;
  } else if (level < 12) {
    return charmeleon;
  } else {
    return charizard;
  }
}