import 'dart:io';
import 'package:imtixon_6/data/model/expanse.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ExpanseLocalServices {
  String pathDataBase = 'expanse';

  Database? _database;

  Future<Database> get database async {
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = "${documentsDirectory.path}/$pathDataBase.db";
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            """CREATE TABLE $pathDataBase (id INTEGER PRIMARY KEY, category TEXT, comment TEXT, dateTime TEXT)""");
      },
    );
  }

  Future<List<ExpanseModel>> getExpanse() async {
    final db = await database;
    final result = await db.query(pathDataBase);
    return result.map((json) => ExpanseModel.fromMap(json)).toList();
  }

  Future<void> insertExpanse(ExpanseModel expanse) async {
    final db = await database;
    await db.insert(pathDataBase, expanse.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateTodo(ExpanseModel expanse) async {
    final db = await database;

    await db.update(pathDataBase, expanse.toMap(),
        where: 'id = ?', whereArgs: [expanse.id]);
  }

  Future<void> deleteTodo(int id) async {
    final db = await database;
    await db.delete(pathDataBase, where: 'id = ?', whereArgs: [id]);
  }
}
