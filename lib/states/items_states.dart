import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden/models/items.dart';
import 'package:my_garden/models/storage/item_model.dart';

// Name our hive box for this data
enum ItemsType { Plants, Grapes, Soils, Animals }

extension ItemsTypeExtension on ItemsType {
  String get box {
    switch (this) {
      case ItemsType.Plants:
        return 'plants';
      case ItemsType.Grapes:
        return 'grapes';
      case ItemsType.Soils:
        return 'soils';
      case ItemsType.Animals:
        return 'animals';
      default:
        return null;
    }
  }
}

class ItemsProvider extends ChangeNotifier {
  Items _items = Items();

  String keyword = "";

  ItemsType _currentType = ItemsType.Animals;

  Item selectedItem;

  setKeyword(String newKeyword) {
    keyword = newKeyword;
    notifyListeners();
  }

  Future<List<Item>> getItems(ItemsType type) async {
    var box = await Hive.openBox<Item>(type.box);

    _currentType = type;
    print("current: $_currentType");

    _items.clearLoadByType(box.values, type);
    return _items.getItemsByKeyword(keyword, type);
  }

  /// Add Item
  void addItem(Item newItem, ItemsType type) async {
    var box = await Hive.openBox<Item>(type.box);
    // Add to our box
    await box.add(newItem);

    print("ezvan most2: $type");

    _items.clearLoadByType(box.values, type);
    notifyListeners();
  }

  void editItem(Item item, int contactKey) async {
    var box = await Hive.openBox<Item>(_currentType.box);
    print("current: $_currentType");
    print("currentKey: $contactKey");

    await box.put(contactKey, item);

    selectedItem = item;

    _items.clearLoadByType(box.values, _currentType);

    notifyListeners();
  }

  int getItemNoteLength(Item item) {
    return item.notes.length;
  }
}
