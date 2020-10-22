import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_garden/common/theme.dart';
import 'package:my_garden/ui/widgets/info_widget.dart';

class RoleWidget extends StatelessWidget {
  final String headlineText;
  const RoleWidget({
    Key key,
    @required this.headlineText,
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
              "$headlineText:",
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
    return InkWell(
      onTap: () => showMaterialModalBottomSheet(
        backgroundColor: Colors.transparent,
        expand: true,
        context: context,
        builder: (context, scrollController) => BottomInfoWidget(
          images: [],
        ),
      ),
      child: Card(
        elevation: 5,
        color: Colors.green[600],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: appTextTheme.headline2,
              ),
              Text(
                "subtext",
                style: appTextTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
