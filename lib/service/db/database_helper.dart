import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static DataBaseHelper? _instance;
  static Database? _database;

  DataBaseHelper._internal() {
    _instance = this;
  }

  factory DataBaseHelper() => _instance ?? DataBaseHelper._internal();
  static const String _tblTodo = "todolist"; // inisisai nama table

  Future<Database> _initializeDB() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      "$path/todolist.db",
      onCreate: (db, version) async {
        await db.execute(''' CREATE TABLE $_tblTodo(
        id TEXT PRIMARY KEY,
        tanggal TEXT,
        judul TEXT,
        todo TEXT,
      )
      ''');
      },
      version: 1,
    );
    return db;
  }

  Future<Database?> get databse async {
    _database ??= await _initializeDB();
    return _database;
  }
}
