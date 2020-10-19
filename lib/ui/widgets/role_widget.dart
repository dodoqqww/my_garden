import 'package:flutter/material.dart';
import 'package:my_garden/common/theme.dart';

class RoleWidget extends StatelessWidget {
  const RoleWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build homeg-somewhere/role");
    return Card(
      elevation: 20,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Teendők:",
              style: appTextTheme.headline2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  _roleText("asd"),
                  Center(
                    child: Text(
                      "Nincs teendő a mai napra.",
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

  Widget _roleText(String text) {
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
