import 'package:flutter/material.dart';
import 'package:my_garden/common/theme.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build settings");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings', style: appTextTheme.headline1),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView(
          children: [
            SwitchListTile(
              title: Text(
                "Lorem Ipsum",
                style: appTextTheme.bodyText1,
              ),
              value: true,
              onChanged: (value) {},
            )
          ],
        ),
      ),
    );
  }
}
