import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static const int VERSION = 1;
  static const String DB = 'database.db';
  Database _db;
  static DBHelper _instance;
  factory DBHelper() {
    if (_instance == null) {
      _instance = DBHelper._internal();
    }
    return _instance;
  }

  DBHelper._internal();

  Future<Database> getDataBase() async {
    if (_db == null) {
      var _directory = await getDatabasesPath();
      var _path = join(_directory, DB);
      _db = await openDatabase(_path, version: VERSION, onCreate: _onCreate);
    }
    return _db;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      create table login (
        id integer primary key autoincrement,
        email text,
        token text
      );
    ''');
  }
}
