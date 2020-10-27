import 'dart:io';

class NoteModel {
  final String date;
  //nem biztos h file

  final List<File> images;

  final String message;
  NoteModel({
    this.date,
    this.images,
    this.message,
  });
}
