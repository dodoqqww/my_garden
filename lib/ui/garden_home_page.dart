import 'package:flutter/material.dart';
import 'package:my_garden/common/theme.dart';

import 'widgets/role_widget.dart';

class HomeGarden extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: EdgeInsets.all(10), shrinkWrap: true, children: [
        RoleWidget(headlineText: "Kerti teendők"),
        _PlantsWidget()
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () => print("add teendő"),
      ),
    );
  }
}

class _PlantsWidget extends StatelessWidget {
  const _PlantsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build homegarden/plants");
    return Card(
      elevation: 20,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Növények:",
              style: appTextTheme.headline2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  _plantsText("asd"),
                  Center(
                    child: Text(
                      "Nincsenek növényeid.",
                      style: appTextTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _plantsText(String text) {
    return Row(
      children: [
        Text(
          text,
          style: appTextTheme.bodyText1,
        ),
        Spacer(),
        Icon(Icons.arrow_right)
      ],
    );
  }
}
