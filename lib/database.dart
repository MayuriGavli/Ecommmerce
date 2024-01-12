import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    // If _database is null, initialize it
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'your_database_name.db');
    return await openDatabase(path, version: 1, onCreate: _createTables);
  }

  void _createTables(Database db, int version) async {
    // Create your tables here
    await db.execute('''
      CREATE TABLE your_table_name (
        id INTEGER PRIMARY KEY,
        name TEXT,
        age INTEGER
      )
    ''');
  }
}
