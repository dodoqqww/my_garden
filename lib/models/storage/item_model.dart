import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_garden/hive_helper/fields/item_fields.dart';
import 'package:my_garden/hive_helper/hive_adapters.dart';
import 'package:my_garden/hive_helper/hive_types.dart';

import '../note_model.dart';
import '../notification_model.dart';

part 'item_model.g.dart';

@HiveType(typeId: HiveTypes.item, adapterName: HiveAdapters.item)
class Item extends HiveObject {
  @HiveField(ItemFields.name)
  final String name;

  @HiveField(ItemFields.subName)
  final String subName;

  @HiveField(ItemFields.description)
  final String description;

  @HiveField(ItemFields.mainImagePath)
  final String mainImagePath;

  @HiveField(ItemFields.notes)
  final List<NoteModel> notes;

  @HiveField(ItemFields.notifications)
  final List<NotificationModel> notifications;
  Item({
    @required this.name,
    @required this.subName,
    @required this.description,
    @required this.mainImagePath,
    @required this.notes,
    @required this.notifications,
  });
}
