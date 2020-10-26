import 'package:hive/hive.dart';
import 'package:my_garden/hive_helper/hive_types.dart';
import 'package:my_garden/hive_helper/hive_adapters.dart';
import 'package:my_garden/hive_helper/fields/garden_fields.dart';

import 'item_model.dart';

part 'garden_model.dart.g.dart';

@HiveType(typeId: HiveTypes.garden, adapterName: HiveAdapters.garden)
class Garden extends HiveObject {
  @HiveField(GardenFields.plants)
  final List<Item> plants;
  Garden({
    this.plants,
  });
}
