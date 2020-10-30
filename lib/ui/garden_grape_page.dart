import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_garden/states/items_states.dart';
import 'package:my_garden/ui/widgets/listwithsearch_widget.dart';
import 'widgets/additem_widget.dart';
import 'package:provider/provider.dart';
import 'widgets/role_widget.dart';

class GrapeGarden extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: EdgeInsets.all(10), shrinkWrap: true, children: [
        // RoleWidget(headlineText: "Szőlő gazdász teendők"),
        ListWithSearch(
          title: "Szőlők",
          type: ItemsType.Grapes,
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
          builder: (context, scrollController) =>
              BottomAddItemWidget(ItemsType.Grapes),
        ),
      ),
    );
  }
}
