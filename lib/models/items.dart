import 'storage/item_model.dart';

class Items {
  final List<Item> _itemsList;

  Items(this._itemsList);

  List<Item> get itemsList => _itemsList;

  clearLoadAll(List<Item> list) {
    _itemsList.clear();
    _itemsList.addAll(list);
  }

  List<Item> getItemsByKeyword(String keyword) {
    return _itemsList
        .where((element) => element.name.contains(keyword))
        .toList();
  }
}
