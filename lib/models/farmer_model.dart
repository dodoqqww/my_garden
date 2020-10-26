import 'package:hive/hive.dart';
import 'package:my_garden/hive_helper/hive_types.dart';
import 'package:my_garden/hive_helper/hive_adapters.dart';
import 'package:my_garden/hive_helper/fields/farmer_fields.dart';

import 'item_model.dart';

part 'farmer_model.g.dart';

@HiveType(typeId: HiveTypes.farmer, adapterName: HiveAdapters.farmer)
class Farmer extends HiveObject {
  @HiveField(FarmerFields.soils)
  final List<Item> soils;
  @HiveField(FarmerFields.animals)
  final List<Item> animals;
  Farmer({
    this.soils,
    this.animals,
  });
}
