import 'package:hive/hive.dart';

import 'package:my_garden/hive_helper/fields/todo_model_fields.dart';
import 'package:my_garden/hive_helper/hive_adapters.dart';
import 'package:my_garden/hive_helper/hive_types.dart';

part 'todo_model.g.dart';

@HiveType(typeId: HiveTypes.todoModel, adapterName: HiveAdapters.todoModel)
class TodoModel extends HiveObject {
  @HiveField(TodoModelFields.title)
  final String title;

  @HiveField(TodoModelFields.subTitle)
  final String subTitle;

  @HiveField(TodoModelFields.message)
  final String message;

  @HiveField(TodoModelFields.date)
  final String date;

  TodoModel({this.title, this.subTitle, this.message, this.date});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TodoModel &&
        o.title == title &&
        o.subTitle == subTitle &&
        o.message == message &&
        o.date == date;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        subTitle.hashCode ^
        message.hashCode ^
        date.hashCode;
  }
}
