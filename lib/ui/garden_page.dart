import 'package:flutter/material.dart';
import 'package:my_garden/models/cart.dart';
import 'package:provider/provider.dart';

import 'bottom_nav.dart';

class GardenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build garden");
    return Scaffold(
      appBar: AppBar(
        title: Text('Garden', style: Theme.of(context).textTheme.headline1),
        backgroundColor: Colors.white,
      ),
      body: Container(),
    );
  }
}
