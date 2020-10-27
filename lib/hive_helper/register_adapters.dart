import 'package:hive/hive.dart';
import 'package:my_garden/models/storage/item_model.dart';
import 'package:my_garden/models/storage/todo_model.dart';

void registerAdapters() {
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(TodoModelAdapter());
}
