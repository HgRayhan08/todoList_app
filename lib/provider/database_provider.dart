import 'package:flutter/material.dart';
import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/service/db/database_helper.dart';
import 'package:todo_list/utils/result_state_data.dart';

class DatabaseProvider extends ChangeNotifier {
  late DataBaseHelper dataBaseHelper;

  DatabaseProvider({required this.dataBaseHelper}) {
    _getTodoList();
  }

  List<TodoList> _todolist = [];
  List<TodoList> get todolist => _todolist;

  late ResultStateData _resultStateData;
  ResultStateData get resulstatedata => _resultStateData;

  String _message = "";
  String get message => _message;

  void _getTodoList() async {
    _todolist = await dataBaseHelper.getListTodo();
    if (_todolist.isNotEmpty) {
      _resultStateData = ResultStateData.hasData;
    } else {
      _resultStateData = ResultStateData.noData;
      _message = "Tidak ada Data";
    }
    notifyListeners();
  }

  void addTodo(TodoList todolist) async {
    try {
      await dataBaseHelper.insertTodo(todolist);
      _getTodoList();
    } catch (e) {
      _resultStateData = ResultStateData.error;
      _message = "error";
      notifyListeners();
    }
  }

  void removeTodo(String idTodo) async {
    try {
      await dataBaseHelper.removeTodo(idTodo);
      _getTodoList();
    } catch (e) {
      _resultStateData = ResultStateData.error;
      _message = "Error";
      notifyListeners();
    }
  }
}
