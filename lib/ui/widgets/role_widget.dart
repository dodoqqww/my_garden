import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_garden/common/theme.dart';
import 'package:my_garden/models/storage/todo_model.dart';
import 'package:my_garden/ui/widgets/info_widget.dart';

class RoleWidget extends StatelessWidget {
  final String headlineText;
  final String emptyText;
  final Future<dynamic> future;

  const RoleWidget(
      {Key key,
      @required this.headlineText,
      @required this.emptyText,
      @required this.future})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TodoModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Card(
              elevation: 20,
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$headlineText:",
                      style: appTextTheme.headline2,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 10),
                        child: snapshot.data.length == 0
                            ? Text(
                                "Nincs teendő a mai napra.",
                                style: appTextTheme.bodyText1,
                              )
                            : ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) =>
                                    _roleText(snapshot.data[index], context))),
                  ],
                ),
              ),
            );
          }
          return loadingWidget();
        });
  }

  Widget loadingWidget() {
    return Card(
        elevation: 20,
        color: Colors.green,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "$headlineText:",
                style: appTextTheme.headline2,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Text(
                    emptyText,
                    style: appTextTheme.bodyText1,
                  ),
                ),
              )
            ])));
  }

  Widget _roleText(TodoModel data, BuildContext context) {
    return InkWell(
      onTap: () => showMaterialModalBottomSheet(
        backgroundColor: Colors.transparent,
        expand: true,
        context: context,
        builder: (context, scrollController) => BottomInfoWidget(
          data: data,
        ),
      ),
      child: Card(
        elevation: 5,
        color: Colors.green[600],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title,
                style: appTextTheme.headline2,
              ),
              Text(
                data.subTitle,
                style: appTextTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
