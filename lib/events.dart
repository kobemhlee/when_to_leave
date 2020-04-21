import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:when_to_leave/item.dart';

class Events extends ChangeNotifier {
  List<Item> eventsList = <Item>[];

  void add(Item newItem){
    eventsList.add(newItem);
    notifyListeners();
  }

  void remove(Item newItem){
    int index = 0;
    for (var val in eventsList){
      if (val == newItem){
        eventsList.removeAt(index);
        notifyListeners();
      }
      index++;
    }
  }

}