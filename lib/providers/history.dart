import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_family_recipes/models/Basket-recipe.dart';
import 'dart:convert';

import 'package:my_family_recipes/models/History.dart';
import 'package:my_family_recipes/utils/db_helper.dart';

class History with ChangeNotifier {
  List<HistoryItem> _items = [];
  List<HistoryItem> get items => [..._items];

  Future<void> fetchAndSetOrders() async {
    final dataList = await DBHelper.getData('orders');

    try {
      _items = dataList.map((jsonItem) {
        // transform recipes
        var recipesListDecoded = jsonItem['recipes'] as List;
        List<BasketItem> recipesList = recipesListDecoded
            .map((jsonBasketItem) => jsonBasketItem.fromJson(jsonBasketItem))
            .toList();

        return HistoryItem(
          jsonItem['id'],
          jsonItem['date'],
          recipesList,
        );
      }).toList();

      notifyListeners();
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  Future<void> saveOrder(List<BasketItem> items) async {
    var dt = DateTime.now();
    var newFormat = DateFormat("dd-MM-yy");
    String updatedDt = newFormat.format(dt);

    var data = {
      'id': dt.toString(),
      'date': updatedDt,
      'recipes': jsonEncode(items),
    };

    print(data);
    await DBHelper.insert('orders', data);
  }
}
