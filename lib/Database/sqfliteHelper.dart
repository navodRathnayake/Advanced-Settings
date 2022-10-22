import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteHelper {
  var _databasePath;
  static const databaseName = 'settings.db';
  static Database? _database;
  static SqfliteHelper instance = SqfliteHelper._init();
  SqfliteHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB(databaseName);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
        'create table themeMode (key TEXT NOT NULL, value INTEGER NOT NULL)');
    await db.insert('themeMode', {'key': 'darkMode', 'value': 1});
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future readMode() async {
    final db = await instance.database;
    final result = await db.query('themeMode',
        columns: ['value'], where: 'key=?', whereArgs: ['darkMode']);
    return result[0]['value'];
  }

  Future<int> updateMode(String mode) async {
    final db = await instance.database;
    return await db.rawUpdate(
        'UPDATE themeMode SET value = ? WHERE key = ?', [mode, 'darkMode']);
  }
}
