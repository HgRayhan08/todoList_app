import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_list/model/todo_model.dart';

class DataBaseHelper {
  static DataBaseHelper? _dataBaseHelper;
  static late Database _database;

  DataBaseHelper._internal() {
    _dataBaseHelper = this;
  }

  factory DataBaseHelper() => _dataBaseHelper ?? DataBaseHelper._internal();
  final String _tblName = "tbl_todolist"; // inisisai nama table

  // Future<Database> _initializeDB() async {
  //   var path = await getDatabasesPath();
  //   var db = openDatabase(
  //     '$path/todolist.db',
  //     onCreate: (db, version) async {
  //       await db.execute(''' CREATE TABLE $_tblName(
  //           id TEXT PRIMARY KEY,
  //           tanggal TEXT ,
  //           judul TEXT,
  //           todo TEXT,
  //          )
  //       ''');
  //     },
  //     version: 1,
  //   );
  //   return db;
  // }

  Future<Database> _initializeDB() async {
    var db = openDatabase(
        join(
          await getDatabasesPath(),
          'movie_db.db',
        ), onCreate: (db, version) async {
      await db.execute(
        '''CREATE TABLE $_tblName(id TEXT PRIMARY KEY, tanggal TEXT, judul TEXT, todo TEXT)''',
      );
    }, version: 1);

    return db;
  }

  Future<Database> get databse async {
    _database = await _initializeDB();
    return _database;
  }

  Future<void> insertTodo(TodoList todo) async {
    final db = await databse;
    await db.insert(_tblName, todo.toJson());
    print(todo.judul);
  }

  Future<List<TodoList>> getListTodo() async {
    final db = await databse;
    List<Map<String, dynamic>> result = await db.query(_tblName);
    return result.map((e) => TodoList.fromJson(e)).toList();
  }

  Future<int> removeTodo(String id) async {
    final db = await databse;
    return await db.delete(_tblName, where: "id=?", whereArgs: [id]);
  }
}
