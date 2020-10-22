import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_garden/common/decoration.dart';
import 'package:my_garden/common/theme.dart';
import 'widgets/listwithsearch_widget.dart';
import 'widgets/role_widget.dart';

class HomeGarden extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: EdgeInsets.all(10), shrinkWrap: true, children: [
        RoleWidget(headlineText: "Kerti teendők"),
        ListWithSearch(
          title: "Növények",
          resultWidget: _InfoWidget(),
        )
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

class _InfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
      children: [_headerCard(), _descCard(), _imagesCard([]), _settingsCard()],
    );
  }

  Widget _headerCard() {
    return Card(
      elevation: 5,
      color: Colors.green,
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
    );
  }

  Widget _descCard() {
    return Card(
        elevation: 5,
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Feljegyzések:",
                style: appTextTheme.headline2,
              ),
              ListView(
                padding: const EdgeInsets.only(top: 10),
                shrinkWrap: true,
                children: [
                  Card(
                    elevation: 5,
                    color: Colors.green[600],
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jégeső után",
                            style: appTextTheme.headline2,
                          ),
                          Text("2020.10.10"),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Widget _imagesCard(List<File> images) {
    return Card(
        elevation: 5,
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Képek:",
                style: appTextTheme.headline2,
              ),
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
                    )),
          ],
        ));
  }

  Widget _settingsCard() {
    return Card(
        elevation: 5,
        color: Colors.green,
        child: ListView(
          shrinkWrap: true,
          children: [
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
            )
          ],
        ));
  }
}
