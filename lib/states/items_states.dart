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

  setKeyword(String newKeyword) {
    keyword = newKeyword;
    notifyListeners();
  }

  Future<List<Item>> getItems(ItemsType type) async {
    var box = await Hive.openBox<Item>(type.box);

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
}
