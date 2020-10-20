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
            appBar:
                //  AppBar(
                // title: Text('Garden', style: appTextTheme.headline1),
                //  backgroundColor: Theme.of(context).primaryColor,
                //  bottom:
                TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Theme.of(context).primaryColor,
              labelColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(icon: Icon(Icons.local_florist)),
                Tab(icon: Icon(Icons.wine_bar)),
                Tab(icon: Icon(Icons.agriculture)),
              ],
            ),
            // ),
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
