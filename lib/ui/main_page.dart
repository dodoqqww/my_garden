import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:my_garden/common/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build home");
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [_HeaderContent(), _mainContent()],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 32,
          ),
          onPressed: () => print("add teendő"),
        ),
      ),
    );
  }

  Widget _mainContent() {
    return ListView(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
      shrinkWrap: true,
      children: [_RoleWidget(), _MissedWidget()],
    );
  }
}

class _RoleWidget extends StatelessWidget {
  const _RoleWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build home/role");
    return Card(
      elevation: 20,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Teendők:",
              style: appTextTheme.headline2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  _roleText("asd"),
                  Center(
                    child: Text(
                      "Nincs teendő a mai napra.",
                      style: appTextTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _roleText(String text) {
    return Row(
      children: [
        Text(
          text,
          style: appTextTheme.bodyText1,
        ),
        Spacer(),
        Icon(Icons.arrow_right)
      ],
    );
  }
}

class _MissedWidget extends StatelessWidget {
  const _MissedWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build home/missed");
    return Card(
      elevation: 20,
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Elmaradt teendők:",
              style: appTextTheme.headline2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  _missedText("asd"),
                  //   ExpansionTile(
                  //     //backgroundColor: Colors.red,
                  //     title: Text(
                  //       "08.11 ads.",
                  //       style: appTextTheme.bodyText1,
                  //     ),
                  //     children: <Widget>[
                  //       Text(
                  //         'Sub title',
                  //       ),
                  //     ],
                  //   ),
                  Center(
                    child: Text(
                      "Mindent elvégeztél.",
                      style: appTextTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _missedText(String text) {
    return Row(
      children: [
        Text(
          "08.11 " + text,
          style: appTextTheme.bodyText1,
        ),
        Spacer(),
        Icon(Icons.arrow_right)
      ],
    );
  }
}

class _HeaderContent extends StatelessWidget {
  const _HeaderContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build home/header");
    DatePickerController _controller = DatePickerController();
    //DateTime _selectedValue = DateTime.now();
    return Container(
      padding: EdgeInsets.all(10),
      child: DatePicker(
        DateTime.now(),
        width: 60,
        height: 80,
        controller: _controller,
        initialSelectedDate: DateTime.now(),
        selectionColor: Theme.of(context).primaryColor,
        selectedTextColor: Colors.white,
        locale: "hu_HU",
        // inactiveDates: [
        //   DateTime.now().add(Duration(days: 3)),
        //   DateTime.now().add(Duration(days: 4)),
        //   DateTime.now().add(Duration(days: 7))
        // ],
        onDateChange: (date) {
          // New date selected
          // setState(() {
          //   _selectedValue = date;
          // });
        },
      ),
    );
  }
}
