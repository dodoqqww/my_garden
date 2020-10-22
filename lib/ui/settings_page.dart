import 'package:flutter/material.dart';
import 'package:my_garden/common/theme.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build settings");
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Settings', style: appTextTheme.headline1),
        //   backgroundColor: Theme.of(context).primaryColor,
        // ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
          children: [
            Card(
              elevation: 20,
              color: Colors.green,
              child: ListView(shrinkWrap: true, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Beállítások:",
                    style: appTextTheme.headline1,
                  ),
                ),
                SwitchListTile(
                  title: Text(
                    "Lorem Ipsum",
                    style: appTextTheme.bodyText1,
                  ),
                  value: true,
                  onChanged: (value) {},
                ),
                SwitchListTile(
                  title: Text(
                    "Lorem Ipsum",
                    style: appTextTheme.bodyText1,
                  ),
                  value: true,
                  onChanged: (value) {},
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
