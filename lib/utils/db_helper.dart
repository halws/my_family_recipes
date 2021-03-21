import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(path.join(dbPath, 'history.db'),
        onCreate: (sql.Database db, int version) => db.execute(
            "CREATE TABLE Orders (id TEXT PRIMARY KEY, date TEXT, recipes TEXT)"),
        version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    try {
      final db = await DBHelper.database();

      await db.insert(
        table,
        data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );
    } on Exception catch (e) {
      print(e);
    }
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
}
