import 'package:flutter/material.dart';
import 'package:my_garden/common/decoration.dart';
import 'package:my_garden/common/theme.dart';
import 'package:my_garden/models/storage/item_model.dart';
import 'package:my_garden/states/items_states.dart';
import 'package:my_garden/ui/info_page.dart';
import 'package:provider/provider.dart';

class ListWithSearch extends StatelessWidget {
  final String title;
  final ItemsType type;

  const ListWithSearch({Key key, this.title, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build somewhere/listWithSearch");
    Provider.of<ItemsProvider>(context, listen: false).keyword = "";

    return Card(
      elevation: 20,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "$title:",
            style: appTextTheme.headline2,
          ),
          _SearchWidget(
            type: type,
          ),
        ]),
      ),
    );
  }
}

class _SearchWidget extends StatelessWidget {
  final ItemsType type;

  const _SearchWidget({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build somewhere/listWithSearch/search");

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.black38.withAlpha(10),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.black.withAlpha(120),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Kereső",
                    hintStyle: TextStyle(
                      color: Colors.black.withAlpha(120),
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (String keyword) {
                    context.read<ItemsProvider>().setKeyword(keyword);
                  },
                ),
              ),
            ],
          ),
        ),
        ListWidget(
          future: context.watch<ItemsProvider>().getItems(type),
        ),
      ],
    );
  }
}

class ListWidget extends StatelessWidget {
  final Future<dynamic> future;

  const ListWidget({Key key, this.future}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build somewhere/listWithSearch/search/list");
    return FutureBuilder<List<Item>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: snapshot.data.isEmpty
                    ? Center(child: Text("Nincsenek mentett elemek."))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) =>
                            _itemWidget(snapshot.data[index], context)));
          }
          return CircularProgressIndicator();
        });
  }

  Widget _itemWidget(Item data, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, "/info",
          arguments: InfoPageArguments(data: "name")),
      child: Card(
        elevation: 5,
        color: Theme.of(context).primaryColorDark,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            simpleAppBorder(
                padding: 2,
                color: Theme.of(context).dividerColor,
                item: Container(
                  height: 80,
                  width: 80,
                  color: Theme.of(context).primaryColor,
                  child: Center(child: Text("N/A")),
                )),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: appTextTheme.headline1,
                  ),
                  Text(data.subName),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
