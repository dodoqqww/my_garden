import 'package:flutter/material.dart';
import 'package:my_garden/common/theme.dart';

Widget simpleAppBorder({@required Widget item, @required Color color}) =>
    Container(
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 2.0, color: color),
            left: BorderSide(width: 2.0, color: color),
            right: BorderSide(width: 2.0, color: color),
            bottom: BorderSide(width: 2.0, color: color),
          ),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: item,
      ),
    );

InputDecoration simpleTextFieldDecoration(
        {@required String text, @required Color color}) =>
    InputDecoration(
      labelStyle: appTextTheme.headline2,
      labelText: text,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 2.0),
      ),
    );

Widget appBottomHeader({@required Widget content, @required Color color}) =>
    Container(
        padding: EdgeInsets.only(top: 100),
        color: Colors.transparent,
        child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(25.0),
                  topRight: const Radius.circular(25.0),
                )),
            child: content));
