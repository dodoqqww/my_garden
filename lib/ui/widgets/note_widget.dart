import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_garden/common/decoration.dart';
import 'package:my_garden/common/theme.dart';
import 'package:my_garden/models/storage/note_model.dart';

// just ui , update after entities
class BottomNoteWidget extends StatelessWidget {
  final NoteModel note;

  const BottomNoteWidget({Key key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build bottomNoteWidget");
    return appBottomHeader(
      color: Theme.of(context).primaryColor,
      content: ListView(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        children: [
          Divider(
            thickness: 2,
            indent: 100,
            endIndent: 100,
            color: Colors.black,
          ),
          ListView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Text(
                    note.title,
                    style: appTextTheme.headline1,
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  IconButton(
                    icon: Icon(Icons.done_outline),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              simpleAppBorder(
                  color: Theme.of(context).dividerColor,
                  item: Text(note.date,
                      // textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF000000)))),
              SizedBox(
                height: 10,
              ),
              simpleAppBorder(
                  color: Theme.of(context).dividerColor,
                  item: Text(note.message,
                      // textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF000000)))),
              SizedBox(
                height: 10,
              ),
              // GridView.builder(
              //     physics: NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 3),
              //     itemCount: note.images.length,
              //     itemBuilder: (context, index) => GestureDetector(
              //           child: Container(
              //             decoration: BoxDecoration(
              //               image: DecorationImage(
              //                 image: FileImage([]),
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           ),
              //           onTap: () => print("image"),
              //         ))
            ],
          )
        ],
      ),
    );
  }
}
