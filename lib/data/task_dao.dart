import 'package:sqflite/sqflite.dart';
import 'package:task_project/components/taskcard.dart';
import 'package:task_project/data/database.dart';
// O DAO (Data Acess Object) é uma forma de org. o db. Interface entre flutter e SQL.

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  List<TaskCard> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('em to list');
    final List<TaskCard> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final TaskCard tarefa = TaskCard(
        name: linha[_name],
        difficulty: linha[_difficulty],
        image: linha[_image],
      );
      tarefas.add(tarefa);
    }
    print('lista de tarefas $tarefas');
    return tarefas;
  }

  Map<String, dynamic> toMap(TaskCard tarefa) {
    print('convertendo tarefa em map');
    final Map<String, dynamic> mapaDeTarefas = {};
    mapaDeTarefas[_name] = tarefa.name;
    mapaDeTarefas[_difficulty] = tarefa.difficulty;
    mapaDeTarefas[_image] = tarefa.image;
    print('mapa de tarefas: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<TaskCard>> findAll() async {
    print('findAll');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    print("result: $result");
    return toList(result);
  }

  Future<List<TaskCard>> find(String nomeDaTarefa) async {
    print('find');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db
        .query(_tableName, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
    print("tarefa encontrada ${toList(result)}");
    return toList(result);
  }

  save(TaskCard tarefa) async {
    print('save');
    final Database db = await getDatabase();
    Map<String, dynamic> taskMap = toMap(tarefa);
    // evitar duplicação de dados
    var itemExists = await find(tarefa.name);
    if (itemExists.isEmpty) {
      print('a tarefa n existia');
      return await db.insert(_tableName, taskMap);
    } else {
      print("tarefa existe");
      return await db.update(_tableName, taskMap,
          where: '$_name = ?', whereArgs: [tarefa.name]);
    }
  }

  delete(String nomeDaTarefa) async {
    print('deletando');
    final Database db = await getDatabase();
    return await db
        .delete(_tableName, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
  }
}
