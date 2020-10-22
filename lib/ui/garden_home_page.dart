import 'package:flutter/material.dart';
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
    return Container(
      child: Text("Info1"),
    );
  }
}
