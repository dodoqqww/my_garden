import 'package:hive/hive.dart';
import 'package:my_garden/hive_helper/hive_types.dart';
import 'package:my_garden/hive_helper/hive_adapters.dart';
import 'package:my_garden/hive_helper/fields/grapes_fields.dart';

import 'item_model.dart';

part 'grapes_model.g.dart';

@HiveType(typeId: HiveTypes.grapes, adapterName: HiveAdapters.grapes)
class Grapes extends HiveObject {
  @HiveField(GrapesFields.grapes)
  final List<Item> grapes;
  Grapes({
    this.grapes,
  });
}
