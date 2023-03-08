import 'package:flutter/material.dart';
import 'package:task_project/components/taskcard.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<TaskCard> taskList = [
    TaskCard(name: "Finalizar curso de flutter da Alura", difficulty: 1),
    TaskCard(name: "Finalizar instalação do Android Studio", difficulty: 3),
    TaskCard(name: "Finalizar instalação do Flutter", difficulty: 2),
    TaskCard(name: "Finalizar curso de flutter da Udemy", difficulty: 5),
    TaskCard(name: "Caminhar com a Pacha", difficulty: 1)
  ];

  void newTask(String name, int difficulty, String image) {
    taskList.add(TaskCard(name: name, difficulty: difficulty, image: image));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    // se colocar o true significa que ele vai notificar quem estiver ouvindo o tempo todo
    // portanto compara, se é diferente, notifica quando mudou
    // se é falto nao atualiza ninguem
    return oldWidget.taskList.length != taskList.length;
  }
}
