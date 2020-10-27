import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:my_garden/states/todo_states.dart';
import 'package:my_garden/ui/bottom_nav.dart';
import 'package:my_garden/ui/info_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'common/theme.dart';
import 'generated/l10n.dart';
import 'hive_helper/register_adapters.dart';
import 'states/bottom_nav_state.dart';
import 'states/database_helper.dart';

void main() {
  registerAdapters();
  runApp(MyApp());
}

Future _initHive() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //can't turn the screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.

        // Provider(create: (context) => CatalogModel()),

        ChangeNotifierProvider(create: (context) => DatabaseData()),
        ChangeNotifierProvider(create: (context) => TodoProvider()),

        ChangeNotifierProvider<AppBottomNavigationBarProvider>(
            child: AppBottomNavigationBar(),
            create: (BuildContext context) => AppBottomNavigationBarProvider()),
      ],
      child: MaterialApp(
        // scale
        builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          // maxWidth: 1200,
          minWidth: 400,
          defaultScale: true,
        ),

        //language
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,

        //title && theme
        title: "Title",
        theme: appTheme,

        //routes
        initialRoute: '/',
        routes: {
          '/': (context) => FutureBuilder(
                future: _initHive(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.error != null) {
                      print(snapshot.error);
                      return Scaffold(
                        body: Center(
                          child: Text('Error initializing hive data store.'),
                        ),
                      );
                    } else {
                      return AppBottomNavigationBar();
                    }
                  } else {
                    return Scaffold();
                  }
                },
              ),

          //(context) => AppBottomNavigationBar(),
          '/info': (context) => InfoPage(),
        },
      ),
    );
  }
}
