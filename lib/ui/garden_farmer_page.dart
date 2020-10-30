import 'package:flutter/material.dart';
import 'package:my_garden/states/items_states.dart';
import 'widgets/listwithsearch_widget.dart';
import 'widgets/role_widget.dart';
import 'package:provider/provider.dart';

class FarmerGarden extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: EdgeInsets.all(10), shrinkWrap: true, children: [
        //  RoleWidget(
        //    headlineText: "Mezőgazdasági teendők",
        //  ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ToggleButtons(
              constraints: BoxConstraints.expand(width: 300 / 2, height: 30),
              children: <Widget>[
                Text("Földek"),
                Text("Állatok"),
              ],
              onPressed: (int index) {},
              isSelected: [true, false],
            ),
          ),
        ),
        // ListWithSearch(title: "Állatok"),
        ListWithSearch(
          title: "Földek",
          type: ItemsType.Soils,
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
