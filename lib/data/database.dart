import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_project/data/task_dao.dart';

Future<Database> getDatabase() async {
  // Esta é a função responsável por encontrar o melhor caminho para armazenar a informação no dispositivo.
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(path,
      onCreate: (db, version) => db.execute(TaskDao.tableSql), version: 1);
}
