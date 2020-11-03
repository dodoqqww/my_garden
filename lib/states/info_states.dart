import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:my_garden/models/items.dart';
import 'package:my_garden/models/storage/item_model.dart';
import 'package:my_garden/states/items_states.dart';

class InfoProvider extends ChangeNotifier {
  Item selectedItem;

  setSelectedItem(Item newItem) {
    selectedItem = newItem;
    notifyListeners();
  }

  int getItemNoteLength() {
    return selectedItem.notes.length;
  }
}
