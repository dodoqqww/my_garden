import 'package:flutter/material.dart';

class InfoPageArguments {
  final Widget bodyWidget;
  InfoPageArguments({this.bodyWidget});
}

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final InfoPageArguments args = ModalRoute.of(context).settings.arguments;
    return args.bodyWidget;
  }
}
