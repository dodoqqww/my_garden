import 'dart:io';

import 'package:hive/hive.dart';
import 'package:my_garden/hive_helper/hive_types.dart';
import 'package:my_garden/hive_helper/hive_adapters.dart';
import 'package:my_garden/hive_helper/fields/note_model_fields.dart';

part 'note_model.g.dart';

@HiveType(typeId: HiveTypes.noteModel, adapterName: HiveAdapters.noteModel)
class NoteModel extends HiveObject {
  @HiveField(NoteModelFields.date)
  final String date;
  //nem biztos h file
  @HiveField(NoteModelFields.images)
  final List<File> images;
  @HiveField(NoteModelFields.message)
  final String message;
  NoteModel({
    this.date,
    this.images,
    this.message,
  });
}
