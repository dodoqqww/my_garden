import 'package:hive/hive.dart';
import 'package:my_garden/hive_helper/hive_types.dart';
import 'package:my_garden/hive_helper/hive_adapters.dart';
import 'package:my_garden/hive_helper/fields/user_fields.dart';
import 'package:my_garden/models/todo_model.dart';

import 'farmer_model.dart';
import 'garden_model.dart.dart';
import 'grapes_model.dart';

part 'user_model.g.dart';

@HiveType(typeId: HiveTypes.user, adapterName: HiveAdapters.user)
class User extends HiveObject {
  @HiveField(UserFields.simplaTodos)
  final List<TodoModel> simplaTodos;
  @HiveField(UserFields.garden)
  final Garden garden;
  @HiveField(UserFields.grapes)
  final Grapes grapes;
  @HiveField(UserFields.farmer)
  final Farmer farmer;
  User({
    this.simplaTodos,
    this.garden,
    this.grapes,
    this.farmer,
  });
}
