import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_garden/common/decoration.dart';
import 'package:my_garden/common/theme.dart';
import 'package:my_garden/models/storage/item_model.dart';
import 'package:my_garden/states/items_states.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

//TODO stateless csak proba miatt stateful
//TODO lehet csak egy helyen lesz hasznalva
class BottomAddItemWidget extends StatefulWidget {
  final ItemsType type;

  BottomAddItemWidget(this.type);

  @override
  BottomAddItemWidgetState createState() => BottomAddItemWidgetState();
}

class BottomAddItemWidgetState extends State<BottomAddItemWidget> {
  String imagePath;
  File image;

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
                    onPressed: () async {
                      Navigator.of(context).pop();

                      if (image != null) {
                        final appDir = await getApplicationDocumentsDirectory();
                        final fileName = basename(image.path);
                        final savedImage =
                            await image.copy('${appDir.path}/$fileName');

                        print(savedImage.path);
                      }

                      context.read<ItemsProvider>().addItem(
                          Item(
                              name: _nameController.text,
                              subName: _subNameController.text,
                              description: _descController.text,
                              mainImagePath: imagePath,
                              notes: [],
                              notifications: []),
                          widget.type);
                    },
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
                        color: Theme.of(context).dividerColor,
                        text: "Elnevezés"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    cursorColor: Colors.black,
                    controller: _subNameController,
                    decoration: simpleTextFieldDecoration(
                        color: Theme.of(context).dividerColor, text: "Alnév"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    cursorColor: Colors.black,
                    maxLines: 10,
                    controller: _descController,
                    decoration: simpleTextFieldDecoration(
                        color: Theme.of(context).dividerColor,
                        text: "Rövid leírás"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  simpleAppBorder(
                      color: Theme.of(context).dividerColor,
                      item: Row(
                        children: <Widget>[
                          image != null
                              ? Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(File(imagePath)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : simpleAppBorder(
                                  padding: 2,
                                  color: Theme.of(context).dividerColor,
                                  item: Container(
                                    height: 80,
                                    width: 80,
                                    color: Theme.of(context).primaryColor,
                                    child: Center(child: Text("N/A")),
                                  )),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Kép hozzáadása",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Color(0xFF000000))),
                          ),
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
      image = File(pickedFile.path);

      setState(() {
        imagePath = pickedFile.path;
      });
    } else {
      print('No image selected.');
    }
  }
}
