import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_garden/common/decoration.dart';
import 'package:my_garden/common/theme.dart';

// just ui , update after entities
class BottomInfoWidget extends StatelessWidget {
  final List<File> images;

  const BottomInfoWidget({Key key, this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build infowidget");
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
                    "X Teendő",
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
                  item: Text("2020.10.10",
                      // textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF000000)))),
              SizedBox(
                height: 10,
              ),
              simpleAppBorder(
                  color: Theme.of(context).dividerColor,
                  item: Text("Teendő ismétlése",
                      // textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF000000)))),
              SizedBox(
                height: 10,
              ),
              simpleAppBorder(
                  color: Theme.of(context).dividerColor,
                  item: Text("Leírás",
                      // textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF000000)))),
              SizedBox(
                height: 10,
              ),
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
    );
  }
}
