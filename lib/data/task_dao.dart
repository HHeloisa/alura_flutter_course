import 'package:task_project/components/taskcard.dart';
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

  // save(TaskCard task) async {}
  // Future<List<TaskCard>> findAll() async {}
  // Future<List<TaskCard>> find(String nomeDaTarefa)
  // delete(String nomeDaTarefa) async {return }
}
