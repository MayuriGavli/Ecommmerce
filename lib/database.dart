// // import 'package:path/path.dart';
// // import 'package:sqflite/sqflite.dart';
// //
// class DBHelper {
//   late Database _database;
//
//   Future<Database> get database async {
//     if (_database != null) return _database;
//
//     // If _database is null, initialize it
//     _database = await initDatabase();
//     return _database;
//   }
//
//   Future<Database> initDatabase() async {
//     return openDatabase(
//       join(await getDatabasesPath(), 'your_database_name.db'),
//       onCreate: (db, version) {
//         return db.execute('''
//           CREATE TABLE your_table_name (
//             id INTEGER PRIMARY KEY,
//             name TEXT,
//             age INTEGER
//           )
//         ''');
//       },
//       version: 1,
//     );
//   }
// }
