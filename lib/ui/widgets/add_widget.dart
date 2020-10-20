import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:my_garden/common/theme.dart';

//TODO stateless csak proba miatt stateful
class BottomAddWidget extends StatefulWidget {
  @override
  BottomAddWidgetState createState() => BottomAddWidgetState();
}

class BottomAddWidgetState extends State<BottomAddWidget> {
  DateTime selectedDate = DateTime.now();

  bool isOften = false;

  final List<File> images = List();

  final TextEditingController _dayController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 100),
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              )),
          child: ListView(
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
                        "Teendő hozzáadása",
                        style: appTextTheme.headline1,
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.done_outline),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                          top:
                              BorderSide(width: 2.0, color: Colors.greenAccent),
                          left:
                              BorderSide(width: 2.0, color: Colors.greenAccent),
                          right:
                              BorderSide(width: 2.0, color: Colors.greenAccent),
                          bottom:
                              BorderSide(width: 2.0, color: Colors.greenAccent),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Text(selectedDate.toString(),
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                          top:
                              BorderSide(width: 2.0, color: Colors.greenAccent),
                          left:
                              BorderSide(width: 2.0, color: Colors.greenAccent),
                          right:
                              BorderSide(width: 2.0, color: Colors.greenAccent),
                          bottom:
                              BorderSide(width: 2.0, color: Colors.greenAccent),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Teendő ismétlése",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xFF000000))),
                            Spacer(),
                            Switch(
                              value: isOften,
                              onChanged: (value) {
                                setState(() {
                                  isOften = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Visibility(
                            visible: isOften,
                            child: TextField(
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.black,
                              controller: _dayController,
                              decoration: InputDecoration(
                                labelStyle: appTextTheme.headline2,
                                labelText: "Gyakoriság(nap)",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.greenAccent, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.greenAccent, width: 2.0),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButtonFormField<String>(
                        iconDisabledColor: Colors.black,
                        iconEnabledColor: Colors.black,
                        decoration: InputDecoration(
                          labelStyle: appTextTheme.headline2,
                          labelText: "Tipus kiválasztása",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 2.0),
                          ),
                        ),
                        focusColor: Colors.greenAccent,
                        isExpanded: true,
                        hint: Text("Tipus"),
                        value: "1",
                        items: <String>['1', '2', '3'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (String val) {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        cursorColor: Colors.black,
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelStyle: appTextTheme.headline2,
                          labelText: "Elnevezés",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 2.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        cursorColor: Colors.black,
                        maxLines: 10,
                        controller: _descController,
                        decoration: InputDecoration(
                          labelStyle: appTextTheme.headline2,
                          labelText: "Leírás",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 2.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  width: 2.0, color: Colors.greenAccent),
                              left: BorderSide(
                                  width: 2.0, color: Colors.greenAccent),
                              right: BorderSide(
                                  width: 2.0, color: Colors.greenAccent),
                              bottom: BorderSide(
                                  width: 2.0, color: Colors.greenAccent),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
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
                          ),
                        ),
                      ),
                      GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemCount: images.length,
                          itemBuilder: (context, index) => GestureDetector(
                                child: Container(
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
        ));
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
