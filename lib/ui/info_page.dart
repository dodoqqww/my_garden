import 'dart:io';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_garden/common/decoration.dart';
import 'package:my_garden/common/theme.dart';
import 'package:my_garden/models/storage/note_model.dart';
import 'package:my_garden/models/storage/item_model.dart';
import 'package:my_garden/states/info_states.dart';
import 'package:my_garden/states/items_states.dart';

import 'widgets/additem_widget.dart';
import 'widgets/addnote_widget.dart';
import 'widgets/note_widget.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build info");
    Item data = context.watch<InfoProvider>().selectedItem;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.name,
          style: appTextTheme.headline1,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        children: [
          _headerCard(context, data),
          _dataCard(context, data),
          _DescCard(
            context: context,
            data: data,
          ),
          _imagesCard(context, data.getAllImageFromNotes()),
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
          builder: (context, scrollController) => BottomAddNoteWidget(
            data: data,
            dataKey: data.key,
          ),
        ),
      ),
    );
  }

  Widget _headerCard(BuildContext context, Item data) {
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
                child: data.mainImagePath == null
                    ? Center(child: Text("N/A"))
                    : Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(File(data.mainImagePath)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              )),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: appTextTheme.headline1,
                ),
                Text(data.subName),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dataCard(BuildContext context, Item data) {
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
              Text(data.description)
            ],
          ),
        ));
  }

  Widget _imagesCard(BuildContext context, List<String> imagesPath) {
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
                padding: const EdgeInsets.all(8.0),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: imagesPath.length,
                itemBuilder: (context, index) => GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(File(imagesPath[index])),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      onTap: () => print("open image"),
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

class _DescCard extends StatelessWidget {
  final Item data;

  final BuildContext context;

  const _DescCard({Key key, @required this.data, @required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build info/desc");
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
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 10),
                shrinkWrap: true,
                itemCount: context.watch<InfoProvider>().getItemNoteLength(),
                itemBuilder: (context, index) {
                  return descItem(data.notes[index]);
                },
              )
            ],
          ),
        ));
  }

  Widget descItem(NoteModel note) {
    return InkWell(
      onTap: () => showMaterialModalBottomSheet(
        backgroundColor: Colors.transparent,
        expand: true,
        context: context,
        builder: (context, scrollController) => BottomNoteWidget(
          note: note,
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
                note.title,
                style: appTextTheme.headline2,
              ),
              Text(note.date),
            ],
          ),
        ),
      ),
    );
  }
}
