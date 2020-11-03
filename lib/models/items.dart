import 'package:my_garden/states/items_states.dart';

import 'storage/item_model.dart';

class Items {
  List<Item> _plants = List();
  List<Item> _grapes = List();
  List<Item> _soils = List();
  List<Item> _animals = List();

  List<Item> itemsByType(ItemsType type) {
    switch (type) {
      case ItemsType.Plants:
        return _plants;
        break;
      case ItemsType.Grapes:
        return _grapes;
        break;
      case ItemsType.Soils:
        return _soils;
        break;
      case ItemsType.Animals:
        return _animals;
        break;
    }
    return null;
  }

  clearLoadByType(
    Iterable<Item> box,
    ItemsType type,
  ) {
    switch (type) {
      case ItemsType.Plants:
        _plants.clear();
        _plants.addAll(box);
        break;
      case ItemsType.Grapes:
        _grapes.clear();
        _grapes.addAll(box);
        break;
      case ItemsType.Soils:
        _soils.clear();
        _soils.addAll(box);

        break;
      case ItemsType.Animals:
        _animals.clear();
        _animals.addAll(box);
        break;
    }
  }

  List<Item> getItemsByKeyword(String keyword, ItemsType type) {
    switch (type) {
      case ItemsType.Plants:
        return _plants
            .where((element) => element.name.contains(keyword))
            .toList();
        break;
      case ItemsType.Grapes:
        return _grapes
            .where((element) => element.name.contains(keyword))
            .toList();
        break;
      case ItemsType.Soils:
        return _soils
            .where((element) => element.name.contains(keyword))
            .toList();
        break;
      case ItemsType.Animals:
        return _animals
            .where((element) => element.name.contains(keyword))
            .toList();
        break;
    }

    return null;
  }
}
