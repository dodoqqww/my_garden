import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_garden/models/storage/item_model.dart';
import 'package:my_garden/states/items_states.dart';
import 'widgets/additem_widget.dart';
import 'widgets/listwithsearch_widget.dart';
import 'package:provider/provider.dart';
import 'widgets/role_widget.dart';

class HomeGarden extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // context.read<ItemsProvider>().getCurrentItems(type: ItemsType.Plants);
    return Scaffold(
        body:
            ListView(padding: EdgeInsets.all(10), shrinkWrap: true, children: [
          /// TODO kell??
          // RoleWidget(headlineText: "Kerti teendők", todoList: []),
          ListWithSearch(
            title: "Növények",
            type: ItemsType.Plants,
          ),
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
            builder: (context, scrollController) =>
                BottomAddItemWidget(ItemsType.Plants),
          ),
        ));
  }
}
