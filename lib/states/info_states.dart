import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden/models/items.dart';
import 'package:my_garden/models/storage/item_model.dart';
import 'package:my_garden/states/items_states.dart';

class InfoProvider extends ChangeNotifier {
  // Items _plants = Items(List());
  // Items _grapes = Items(List());
  // Items _soils = Items(List());
  // Items _animals = Items(List());

  Item selectedItem;

  setSelectedItem(Item newItem) {
    selectedItem = newItem;
    notifyListeners();
  }

  void editItem(Item item, int contactKey, ItemsType type) async {
    var box = await Hive.openBox<Item>(type.box);

    print(item.name);
    print(item.notes.length);
    print(contactKey);
    print(type);

    await box.put(contactKey, item);

    selectedItem = item;

    // Update _contacts List with all box values
    //switch (type) {
    //  case ItemsType.Plants:
    //    _plants.clearLoadAll(box.values.toList());
    //    break;
    //  case ItemsType.Grapes:
    //    _grapes.clearLoadAll(box.values.toList());
    //    break;
    //  case ItemsType.Soils:
    //    _soils.clearLoadAll(box.values.toList());
    //    break;
    //  case ItemsType.Animals:
    //    _animals.clearLoadAll(box.values.toList());
    //    break;
    //}

    notifyListeners();
  }

  int getItemNoteLength(Item item) {
    return selectedItem.notes.length;
  }
}
