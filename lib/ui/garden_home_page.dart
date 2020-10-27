import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'widgets/additem_widget.dart';
import 'widgets/listwithsearch_widget.dart';
import 'widgets/role_widget.dart';

class HomeGarden extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            ListView(padding: EdgeInsets.all(10), shrinkWrap: true, children: [
          /// TODO kell??
          // RoleWidget(headlineText: "Kerti teendők", todoList: []),
          ListWithSearch(
            title: "Növények",
            data: "home",
          )
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 32,
          ),
          onPressed: () => showMaterialModalBottomSheet(
            backgroundColor: Colors.transparent,
            expand: true,
            context: context,
            builder: (context, scrollController) => BottomAddItemWidget(),
          ),
        ));
  }
}
