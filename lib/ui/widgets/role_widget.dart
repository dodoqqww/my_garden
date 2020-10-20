import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_garden/common/theme.dart';

class RoleWidget extends StatelessWidget {
  const RoleWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build home-somewhere/role");
    return Card(
      elevation: 20,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Teendők:",
              style: appTextTheme.headline2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  _roleText("asd", context),
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

  Widget _roleText(String text, BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: appTextTheme.bodyText1,
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.arrow_right),
          onPressed: () => showMaterialModalBottomSheet(
            context: context,
            builder: (context, scrollController) => Container(
              child: Text("asd"),
            ),
          ),
        )
      ],
    );
  }
}
