import 'package:flutter/material.dart';
import 'package:my_garden/common/decoration.dart';
import 'package:my_garden/common/theme.dart';
import 'package:my_garden/models/storage/todo_model.dart';
import 'package:my_garden/states/todo_states.dart';
import 'package:provider/provider.dart';

// just ui , update after entities
class BottomInfoWidget extends StatelessWidget {
  final TodoModel data;

  const BottomInfoWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build info");
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
                    "${data.title}",
                    style: appTextTheme.headline1,
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => {
                      Navigator.of(context).pop(),
                      //TODO why is it work?
                      context.read<TodoProvider>().deleteTodo(data.key)
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.done_outline),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              simpleAppBorder(
                  color: Theme.of(context).dividerColor,
                  item: Text("${data.date}",
                      // textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF000000)))),
              SizedBox(
                height: 10,
              ),
              //TODO test kell?
              //  simpleAppBorder(
              //      color: Theme.of(context).dividerColor,
              //      item: Text("Teendő ismétlése",
              //          // textAlign: TextAlign.center,
              //          style: TextStyle(color: Color(0xFF000000)))),
              //  SizedBox(
              //    height: 10,
              //  ),
              simpleAppBorder(
                  color: Theme.of(context).dividerColor,
                  item: Text("${data.message}",
                      // textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF000000)))),
              //    SizedBox(
              //      height: 10,
              //    ),
              //    GridView.builder(
              //        physics: NeverScrollableScrollPhysics(),
              //        shrinkWrap: true,
              //        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //            crossAxisCount: 3),
              //        itemCount: images.length,
              //        itemBuilder: (context, index) => GestureDetector(
              //              child: Container(
              //                decoration: BoxDecoration(
              //                  image: DecorationImage(
              //                    image: FileImage(images[index]),
              //                    fit: BoxFit.cover,
              //                  ),
              //                ),
              //              ),
              //              onTap: () => print("image"),
              //            ))
            ],
          )
        ],
      ),
    );
  }
}
