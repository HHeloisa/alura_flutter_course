import 'package:flutter/material.dart';
import 'package:task_project/components/taskcard.dart';
import 'package:task_project/data/task_dao.dart';
//import 'package:task_project/data/task_inherited.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 70, top: 12),
        child: FutureBuilder<List<TaskCard>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<TaskCard>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text("Carregando")
                      ],
                    ),
                  );
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text("Carregando")
                      ],
                    ),
                  );
                case ConnectionState.active:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text("Carregando")
                      ],
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final TaskCard tarefa = items[index];
                            return tarefa;
                          });
                    } else {
                      return Center(
                        child: Column(children: const [
                          Icon(Icons.error_outline, size: 128),
                          Text(
                            "Não há tarefas. Adicione",
                            style: TextStyle(fontSize: 32),
                          )
                        ]),
                      );
                    }
                  }
                  return const Text("Erro ao carregar tarefas");
              }
              return const Text('Erro desconhecido');
            }),
      ),         
      // Forma de puxar os dados do taskInherited
      // ListView(
      //   children: TaskInherited.of(context).taskList,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (contextNew) => FormScreen(
                        taskContext: context,
                      ))).then((value) => setState((() => {})));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
