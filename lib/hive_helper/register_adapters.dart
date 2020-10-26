import 'package:hive/hive.dart';
import 'package:my_garden/models/farmer_model.dart';
import 'package:my_garden/models/garden_model.dart.dart';
import 'package:my_garden/models/grapes_model.dart';
import 'package:my_garden/models/item_model.dart';
import 'package:my_garden/models/note_model.dart';
import 'package:my_garden/models/notification_model.dart';
import 'package:my_garden/models/todo_model.dart';
import 'package:my_garden/models/user_model.dart';

void registerAdapters() {
	Hive.registerAdapter(FarmerAdapter());
	Hive.registerAdapter(GardenAdapter());
	Hive.registerAdapter(GrapesAdapter());
	Hive.registerAdapter(ItemAdapter());
	Hive.registerAdapter(NoteModelAdapter());
	Hive.registerAdapter(NotificationModelAdapter());
	Hive.registerAdapter(TodoModelAdapter());
	Hive.registerAdapter(UserAdapter());
}
