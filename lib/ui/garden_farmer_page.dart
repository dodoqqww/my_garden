import 'package:flutter/material.dart';
import 'widgets/role_widget.dart';

class FarmerGarden extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.all(10),
          shrinkWrap: true,
          children: [RoleWidget(headlineText: "Mezőgazdasági teendők")]),
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
