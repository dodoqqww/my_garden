import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_garden/common/decoration.dart';
import 'package:my_garden/common/theme.dart';

//TODO stateless csak proba miatt stateful
//TODO lehet csak egy helyen lesz hasznalva
class BottomAddItemWidget extends StatefulWidget {
  @override
  BottomAddItemWidgetState createState() => BottomAddItemWidgetState();
}

class BottomAddItemWidgetState extends State<BottomAddItemWidget> {
  final List<File> images = List();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _subNameController = TextEditingController();

  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    "X hozzáadása",
                    style: appTextTheme.headline1,
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.done_outline),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    cursorColor: Colors.black,
                    controller: _nameController,
                    decoration: simpleTextFieldDecoration(
                        color: Colors.greenAccent, text: "Elnevezés"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    cursorColor: Colors.black,
                    controller: _subNameController,
                    decoration: simpleTextFieldDecoration(
                        color: Colors.greenAccent, text: "Alnév"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    cursorColor: Colors.black,
                    maxLines: 10,
                    controller: _descController,
                    decoration: simpleTextFieldDecoration(
                        color: Colors.greenAccent, text: "Rövid leírás"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  simpleAppBorder(
                      color: Colors.greenAccent,
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
}
