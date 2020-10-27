import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../models/storage/item_model.dart';
import '../models/storage/todo_model.dart';

class DatabaseData extends ChangeNotifier {
  // Name our hive box for this data
  String _todosBox = "todos";
  String _plantsBox = "plants";
  String _grapesBox = "grapes";
  String _soilsBox = "soils";
  String _animalsBox = "animals";

  List<TodoModel> _todosList = List();
  List<Item> _plantsList = List();
  List<Item> _grapesList = List();
  List<Item> _soilsList = List();
  List<Item> _animalsList = List();

  void getTodos() async {
    var box = await Hive.openBox<TodoModel>(_todosBox);
    print(_todosList.length);
    //read
    _todosList = box.values.toList();

    print(_todosList.length);
    // notifyListeners();
  }

  /// Get Todo
  TodoModel getTodo(index) {
    return _todosList[index];
  }

  /// Contact Count
  /// Returns the length of the contact array
  // int get contactCount {
  //   return _contacts.length;
  // }

  /// Add Todo
  void addContact(TodoModel newTodo) async {
    var box = await Hive.openBox<TodoModel>(_todosBox);
    // Add to our box
    await box.add(newTodo);
    // Update our provider state data with a hive read, and refresh the ui
    _todosList = box.values.toList();
    notifyListeners();
  }

//
  /// Delete Contact
  void deleteTodo(key) async {
    var box = await Hive.openBox<TodoModel>(_todosBox);

    await box.delete(key);
    // Update _contacts List with all box values
    _todosList = box.values.toList();

    print("Deleted with key: " + key.toString());
    // Update UI
    notifyListeners();
  }

  /// Edit Contact
  /// Overwrites our existing contact based on key with a brand new updated Contact object
  void editContact({TodoModel todo, int contactKey}) async {
    var box = await Hive.openBox<TodoModel>(_todosBox);

    // Add a contact to our box
    await box.put(contactKey, todo);

    // Update _contacts List with all box values
    _todosList = box.values.toList();

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
