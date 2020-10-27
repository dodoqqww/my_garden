import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_garden/states/todo_states.dart';
import 'widgets/addtodo_widget.dart';
import 'widgets/role_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build home");
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [_HeaderContent(), mainContent(context)],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 32,
          ),
          onPressed: () => showMaterialModalBottomSheet(
            backgroundColor: Colors.transparent,
            expand: true,
            context: context,
            builder: (context, scrollController) => BottomAddTodoWidget(),
          ),
        ),
      ),
    );
  }
}

Widget mainContent(BuildContext context) {
  print("build home/mainContent");
  return Expanded(
    child: ListView(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
      shrinkWrap: true,
      children: [_AllRolesWidget(), _MissedRolesWidget()],
    ),
  );
}

class _AllRolesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build home/allrole");
    return RoleWidget(
      headlineText: "Minden teendő",
      future: context.watch<TodoProvider>().getTodosByDate("2020.10.27"),
    );
  }
}

class _MissedRolesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build home/missedrole");
    return RoleWidget(
      headlineText: "Elmaradt teendők",
      future: null,
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
