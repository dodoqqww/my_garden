import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_garden/hive_helper/hive_types.dart';
import 'package:my_garden/hive_helper/hive_adapters.dart';
import 'package:my_garden/hive_helper/fields/todo_model_fields.dart';

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

  @HiveField(TodoModelFields.isDone)
  bool isDone;

  TodoModel(
      {@required this.title,
      @required this.subTitle,
      @required this.message,
      @required this.date,
      @required this.isDone});
}
