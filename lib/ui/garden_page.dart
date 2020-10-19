import 'package:flutter/material.dart';
import 'package:my_garden/common/theme.dart';
import 'package:my_garden/ui/garden_farmer_page.dart';
import 'package:my_garden/ui/garden_grape_page.dart';
import 'package:my_garden/ui/garden_home_page.dart';

class GardenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build garden");
    return SafeArea(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Garden', style: appTextTheme.headline1),
              backgroundColor: Theme.of(context).primaryColor,
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                HomeGarden(),
                GrapeGarden(),
                FarmerGarden(),
              ],
            ),
          )),
    );
  }
}
