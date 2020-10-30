import 'dart:io';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_garden/common/decoration.dart';
import 'package:my_garden/common/theme.dart';
import 'package:my_garden/states/items_states.dart';

import 'widgets/additem_widget.dart';
import 'widgets/addnote_widget.dart';
import 'widgets/note_widget.dart';

class InfoPageArguments {
  final String data;
  InfoPageArguments({this.data});
}

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final InfoPageArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.data,
          style: appTextTheme.headline1,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        children: [
          _headerCard(context),
          _dataCard(context),
          _descCard(context),
          _imagesCard(context, []),
          _settingsCard(context)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () => showMaterialModalBottomSheet(
          backgroundColor: Colors.transparent,
          expand: true,
          context: context,
          builder: (context, scrollController) => BottomAddNoteWidget(),
        ),
      ),
    );
  }

  Widget _headerCard(BuildContext context) {
    return Card(
      elevation: 5,
      color: Theme.of(context).primaryColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          simpleAppBorder(
              padding: 2,
              color: Theme.of(context).dividerColor,
              item: Container(
                height: 80,
                width: 80,
                color: Theme.of(context).primaryColor,
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

  Widget _dataCard(BuildContext context) {
    return Card(
        elevation: 5,
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Leírás:",
                    style: appTextTheme.headline2,
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                    ),
                    onPressed: () => showMaterialModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      expand: true,
                      context: context,
                      builder: (context, scrollController) =>
                          //TODO csak ideiglenes
                          BottomAddItemWidget(ItemsType.Plants),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Widget _descCard(BuildContext context) {
    return Card(
        elevation: 5,
        color: Theme.of(context).primaryColor,
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
                  InkWell(
                    onTap: () => showMaterialModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      expand: true,
                      context: context,
                      builder: (context, scrollController) => BottomNoteWidget(
                        note: "Ez egy note.",
                        images: [],
                      ),
                    ),
                    child: Card(
                      elevation: 5,
                      color: Theme.of(context).primaryColorDark,
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
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Widget _imagesCard(BuildContext context, List<File> images) {
    return Card(
        elevation: 5,
        color: Theme.of(context).primaryColor,
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

  Widget _settingsCard(BuildContext context) {
    return Card(
        elevation: 5,
        color: Theme.of(context).primaryColor,
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
