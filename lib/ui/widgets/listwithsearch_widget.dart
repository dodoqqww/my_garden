import 'package:flutter/material.dart';
import 'package:my_garden/common/decoration.dart';
import 'package:my_garden/common/theme.dart';
import 'package:my_garden/ui/info_page.dart';
import 'package:my_garden/ui/widgets/search_widget.dart';

class ListWithSearch extends StatelessWidget {
  final String title;
  final Widget resultWidget;

  const ListWithSearch({Key key, this.title, this.resultWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build somewhere/listWithSearch");
    return Card(
      elevation: 20,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$title:",
              style: appTextTheme.headline2,
            ),
            SearchWidget(),
            ListView(
              padding: const EdgeInsets.only(top: 10),
              shrinkWrap: true,
              children: [
                _itemWidget("asd", context),
                SizedBox(
                  height: 8,
                ),
                _itemWidget("asd", context),
                Center(
                  child: Text(
                    "Nincsenek növényeid.",
                    style: appTextTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemWidget(String text, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, "/info",
          arguments: InfoPageArguments(bodyWidget: resultWidget)),
      child: Card(
        elevation: 5,
        color: Colors.green[600],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            simpleAppBorder(
                padding: 2,
                color: Colors.greenAccent,
                item: Container(
                  height: 80,
                  width: 80,
                  color: Colors.green,
                  child: Center(child: Text("N/A")),
                )),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: appTextTheme.headline1,
                  ),
                  Text("Subtitle"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
