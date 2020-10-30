import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden/models/todos.dart';
import 'package:my_garden/utils/dateformats.dart';
import '../models/storage/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  // Name our hive box for this data
  String _todosBox = "todos";

  Todos _todos = Todos(List());

  Todos get todos => _todos;

  String _currentDate = dateToString(DateTime.now());

  String get currentDate => _currentDate;

  set currentDate(String newDate) {
    _currentDate = newDate;
    print("new date: $newDate");
    notifyListeners();
  }

//  void getTodos() async {
//    var box = await Hive.openBox<TodoModel>(_todosBox);
//// print(_todos.length);
//
//    //read
//    _todos.clearLoadAll(box.values.toList());
//
//    // print(_todos.length);
//    // notifyListeners();
//  }

  /// Get Todo
//  TodoModel getTodo(index) {
//    return _todos.getItemByIndex(index);
//  }

  /// Get Todo by date TODO talán
  Future<List<TodoModel>> getTodosCurrentDate() async {
    print("search date: $_currentDate");
    var box = await Hive.openBox<TodoModel>(_todosBox);
    _todos.clearLoadAll(box.values.toList());
    return _todos.getTodosByDate(_currentDate);
  }

  //TODO test
  //todos unDone and before today
  Future<List<TodoModel>> getMissedTodos() async {
    print("today: ${dateToString(DateTime.now())}");
    var box = await Hive.openBox<TodoModel>(_todosBox);
    _todos.clearLoadAll(box.values.toList());

    var beforeToday = _todos.getTodosBeforeDate(dateToString(DateTime.now()));
    var unDone = _todos.getUnDoneTodos();

    return unDone.where((element) => beforeToday.contains(element)).toList();
  }

  /// Add Todo
  void addTodo(TodoModel newTodo) async {
    var box = await Hive.openBox<TodoModel>(_todosBox);
    // Add to our box
    await box.add(newTodo);
    // Update our provider state data with a hive read, and refresh the ui
    _todos.clearLoadAll(box.values.toList());
    notifyListeners();
  }

  /// Delete Todo
  void deleteTodo(key) async {
    var box = await Hive.openBox<TodoModel>(_todosBox);

    await box.delete(key);
    // Update _contacts List with all box values
    _todos.clearLoadAll(box.values.toList());

    print("Deleted with key: " + key.toString());
    // Update UI
    notifyListeners();
  }

  /// Edit Todo
  /// Overwrites our existing contact based on key with a brand new updated Contact object
  void editTodo(TodoModel todo, int contactKey) async {
    var box = await Hive.openBox<TodoModel>(_todosBox);

    // Add a contact to our box
    await box.put(contactKey, todo);

    // Update _contacts List with all box values
    _todos.clearLoadAll(box.values.toList());

    print('editted: ' + todo.title);

    notifyListeners();
  }
}
