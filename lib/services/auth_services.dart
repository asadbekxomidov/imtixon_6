import 'package:sqflite/sqflite.dart';

class AuthServices {
  String pathDataBase = 'user';
  Database? database;

  Future<void> creteDatabase(Database db) async {
    if (db != null) {
      print('DATABASE Yaratilmadi');
    } else {
      print('DATABASE YARATILDI');
    }
    db.execute(
        """CREATE TABLE $pathDataBase (id INTEGER PRIMARY KEY, username TEXT, password TEXT,));
""");
  }

  Future<void> initialDatabase() async {
    String pathDatabase = await getDatabasesPath();
    final db = await openDatabase(
      '$pathDataBase/user.db',
      version: 1,
      onOpen: creteDatabase,
    );
  }
}
