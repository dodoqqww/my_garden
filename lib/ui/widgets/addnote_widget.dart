import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:my_garden/common/decoration.dart';
import 'package:my_garden/common/theme.dart';
import 'package:my_garden/models/storage/note_model.dart';
import 'package:my_garden/models/storage/item_model.dart';
import 'package:my_garden/states/info_states.dart';
import 'package:my_garden/states/items_states.dart';
import 'package:provider/provider.dart';

//TODO stateless csak proba miatt stateful
//TODO lehet csak egy helyen lesz hasznalva
class BottomAddNoteWidget extends StatefulWidget {
  final Item data;
  final int dataKey;

  const BottomAddNoteWidget({Key key, this.data, this.dataKey})
      : super(key: key);

  @override
  BottomAddNoteWidgetState createState() => BottomAddNoteWidgetState();
}

class BottomAddNoteWidgetState extends State<BottomAddNoteWidget> {
  DateTime selectedDate = DateTime.now();
  final List<File> images = List();

  final TextEditingController _nameController = TextEditingController();

  //final TextEditingController _dayController = TextEditingController();

  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // print("hsoz: " + widget.data.notes.length.toString());
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
                  Text(
                    "Note hozzáadása",
                    style: appTextTheme.headline1,
                  ),
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.done_outline),
                      onPressed: () {
                        Navigator.of(context).pop();

                        Item newData = widget.data.copyWith();

                        newData.notes.add(NoteModel(
                            title: _nameController.text,
                            date: DateFormat('yyyy.MM.dd').format(selectedDate),
                            message: _descController.text,
                            images: []));

                        context
                            .read<ItemsProvider>()
                            .editItem(newData, widget.dataKey);
                      }),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    cursorColor: Colors.black,
                    controller: _nameController,
                    decoration: simpleTextFieldDecoration(
                        color: Theme.of(context).dividerColor,
                        text: "Elnevezés"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  simpleAppBorder(
                    color: Theme.of(context).dividerColor,
                    item: Row(
                      children: <Widget>[
                        Text(DateFormat('yyyy.MM.dd').format(selectedDate),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF000000))),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.date_range),
                          onPressed: () {
                            _selectDate(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    cursorColor: Colors.black,
                    maxLines: 10, //TODO több sor de uhgyanekkora méret
                    controller: _descController,
                    decoration: simpleTextFieldDecoration(
                        color: Theme.of(context).dividerColor, text: "Leírás"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  simpleAppBorder(
                      color: Theme.of(context).dividerColor,
                      item: Row(
                        children: <Widget>[
                          Text("Kép hozzáadása",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF000000))),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.camera),
                            onPressed: () {
                              getImage(ImageSource.camera);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.image),
                            onPressed: () {
                              getImage(ImageSource.gallery);
                            },
                          ),
                        ],
                      )),
                  GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemCount: images.length,
                      itemBuilder: (context, index) => GestureDetector(
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(images[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () => print("image"),
                          ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Future getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      setState(() {
        File image = File(pickedFile.path);
        images.add((image));
        print(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      currentDate: selectedDate,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2022),
    );
    if (d != null) {
      setState(() {
        selectedDate = d;
      });
    }
  }
}
