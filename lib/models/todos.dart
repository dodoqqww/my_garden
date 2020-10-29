import 'package:my_garden/utils/dateformats.dart';

import 'storage/todo_model.dart';

class Todos {
  final List<TodoModel> _todosList;

  Todos(this._todosList);

  clearLoadAll(List<TodoModel> list) {
    _todosList.clear();
    _todosList.addAll(list);
  }

  TodoModel getItemByIndex(int index) {
    return _todosList[index];
  }

  List<TodoModel> getTodosByDate(String date) {
    return _todosList.where((element) => element.date == date).toList();
  }

  List<TodoModel> getTodosBeforeDate(String date) {
    return _todosList
        .where((element) =>
            stringToDate(element.date).isBefore(stringToDate(date)))
        .toList();
  }

  List<TodoModel> getUnDoneTodos() {
    return _todosList.where((element) => element.isDone != true).toList();
  }
}
