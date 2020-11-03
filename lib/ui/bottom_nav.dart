import 'package:flutter/material.dart';
import 'package:my_garden/states/bottom_nav_state.dart';
import 'garden_page.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';
import 'settings_page.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final currentTab = [
    HomePage(),
    GardenPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    print("build bottom");
    var provider = Provider.of<AppBottomNavigationBarProvider>(context);
    //TODO test
    //var provider2 = Provider.of<DatabaseData>(context);
    // provider2.getTodos();
    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Garden',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
      ),
    );
  }
}
