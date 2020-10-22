import 'package:flutter/material.dart';

//TODO lehet mehet egybe ami hasznalja listwithsearch
class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black38.withAlpha(10),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            color: Colors.black.withAlpha(120),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Kereső",
                hintStyle: TextStyle(
                  color: Colors.black.withAlpha(120),
                ),
                border: InputBorder.none,
              ),
              onChanged: (String keyword) {},
            ),
          ),
        ],
      ),
    );
  }
}
