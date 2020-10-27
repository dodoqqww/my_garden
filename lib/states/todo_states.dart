import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../models/storage/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  // Name our hive box for this data
  String _todosBox = "todos";

  var _currentDate = DateTime.now();

  List<TodoModel> todosList = List();

  void getTodos() async {
    var box = await Hive.openBox<TodoModel>(_todosBox);
    print(todosList.length);
    //read
    todosList = box.values.toList();

    print(todosList.length);
    // notifyListeners();
  }

  /// Get Todo
  TodoModel getTodo(index) {
    return todosList[index];
  }

  /// Get Todo by date TODO talán
  Future<List<TodoModel>> getTodosByDate(String date) async {
    var box = await Hive.openBox<TodoModel>(_todosBox);
    todosList = box.values.toList();
    return todosList.where((element) => element.date == date).toList();
  }

  /// Contact Count
  /// Returns the length of the contact array
  // int get contactCount {
  //   return _contacts.length;
  // }

  /// Add Todo
  void addTodo(TodoModel newTodo) async {
    var box = await Hive.openBox<TodoModel>(_todosBox);
    // Add to our box
    await box.add(newTodo);
    // Update our provider state data with a hive read, and refresh the ui
    todosList = box.values.toList();
    notifyListeners();
  }

//
  /// Delete Contact
  void deleteTodo(key) async {
    var box = await Hive.openBox<TodoModel>(_todosBox);
    // todosList = box.values.toList();
//
    // data.key;
//
    // var _key = todosList.where((e) => e == data).first.key;

    await box.delete(key);
    // Update _contacts List with all box values
    todosList = box.values.toList();

    print("Deleted with key: " + key.toString());
    // Update UI
    notifyListeners();
  }

  /// Edit Contact
  /// Overwrites our existing contact based on key with a brand new updated Contact object
  void editTodo({TodoModel todo, int contactKey}) async {
    var box = await Hive.openBox<TodoModel>(_todosBox);

    // Add a contact to our box
    await box.put(contactKey, todo);

    // Update _contacts List with all box values
    todosList = box.values.toList();

    print('editted: ' + todo.title);

    // Update UI
    notifyListeners();
  }

//  /// Set an active contact we can notify listeners for
//  void setActiveContact(key) async {
//    var box = await Hive.openBox<Contact>(_boxName);
//    _activeContact = box.get(key);
//    notifyListeners();
//  }

  /// Get Active Contact
  // Contact getActiveContact() {
  //   return _activeContact;
  // }
}
