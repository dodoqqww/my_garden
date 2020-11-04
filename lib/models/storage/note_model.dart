import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:my_garden/hive_helper/hive_types.dart';
import 'package:my_garden/hive_helper/hive_adapters.dart';
import 'package:my_garden/hive_helper/fields/note_model_fields.dart';

part 'note_model.g.dart';

@HiveType(typeId: HiveTypes.noteModel, adapterName: HiveAdapters.noteModel)
class NoteModel extends HiveObject {
  @HiveField(NoteModelFields.title)
  final String title;
  @HiveField(NoteModelFields.date)
  final String date;

  @HiveField(NoteModelFields.images)
  final List<String> images;

  @HiveField(NoteModelFields.message)
  final String message;

  NoteModel(
      {@required this.title,
      @required this.date,
      @required this.images,
      @required this.message});
}
