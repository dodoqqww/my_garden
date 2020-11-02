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
  //ItemsType _currentItemType = ItemsType.Plants;

  Items _plants = Items(List());
  Items _grapes = Items(List());
  Items _soils = Items(List());
  Items _animals = Items(List());

  String keyword = "";

  ItemsType _currentType = ItemsType.Animals;

  Item selectedItem;

  setSelectedItem(Item newItem) {
    selectedItem = newItem;
    notifyListeners();
  }

  setKeyword(String newKeyword) {
    keyword = newKeyword;
    notifyListeners();
  }

  Future<List<Item>> getItems(ItemsType type) async {
    var box = await Hive.openBox<Item>(type.box);

    _currentType = type;
    print("current: $_currentType");

    switch (type) {
      case ItemsType.Plants:
        _plants.clearLoadAll(box.values.toList());
        return _plants.getItemsByKeyword(keyword);
        break;
      case ItemsType.Grapes:
        _grapes.clearLoadAll(box.values.toList());
        return _grapes.getItemsByKeyword(keyword);
        break;
      case ItemsType.Soils:
        _soils.clearLoadAll(box.values.toList());
        return _soils.getItemsByKeyword(keyword);
        break;
      case ItemsType.Animals:
        _animals.clearLoadAll(box.values.toList());
        return _animals.getItemsByKeyword(keyword);
        break;
    }
    return null;
  }

  /// Add Item
  void addItem(Item newItem, ItemsType type) async {
    var box = await Hive.openBox<Item>(type.box);
    // Add to our box
    await box.add(newItem);

    print("ezvan most2: $type");
    // Update our provider state data with a hive read, and refresh the ui
    switch (type) {
      case ItemsType.Plants:
        _plants.clearLoadAll(box.values.toList());
        break;
      case ItemsType.Grapes:
        _grapes.clearLoadAll(box.values.toList());
        break;
      case ItemsType.Soils:
        _soils.clearLoadAll(box.values.toList());
        break;
      case ItemsType.Animals:
        _animals.clearLoadAll(box.values.toList());
        break;
    }
    notifyListeners();
  }

  void editItem(Item item, int contactKey) async {
    var box = await Hive.openBox<Item>(_currentType.box);
    print("current: $_currentType");
    print("currentKey: $contactKey");
    // Add a contact to our box
    await box.put(contactKey, item);

    selectedItem = item;

    // Update _contacts List with all box values
    switch (_currentType) {
      case ItemsType.Plants:
        _plants.clearLoadAll(box.values.toList());
        break;
      case ItemsType.Grapes:
        _grapes.clearLoadAll(box.values.toList());
        break;
      case ItemsType.Soils:
        _soils.clearLoadAll(box.values.toList());
        break;
      case ItemsType.Animals:
        _animals.clearLoadAll(box.values.toList());
        break;
    }

    //  print('editted: ' + todo.title);

    notifyListeners();
  }

  int getItemNoteLength(Item item) {
    return item.notes.length;
  }
}
