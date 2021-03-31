import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_family_recipes/models/Basket-recipe.dart';
import 'dart:convert';

import 'package:my_family_recipes/models/History.dart';
import 'package:my_family_recipes/utils/db_helper.dart';

class History with ChangeNotifier {
  List<HistoryItem> _items = [];
  List<HistoryItem> get items => [..._items];

  List<BasketItem> parseRecipes(String json) {
    // final recipes = jsonDecode(json).cast<List<dynamic>>();
    final recipes = jsonDecode(json) as List;
    print(recipes.runtimeType);

    return recipes.map<BasketItem>((e) => BasketItem.fromJson(e)).toList();
  }

  Future<void> fetchAndSetOrders() async {
    final dataList = await DBHelper.getData('orders');
    print(dataList);
    try {
      _items = dataList.map((jsonItem) {
        // transform recipes
        print(jsonDecode(jsonItem['recipes']));

        var recipesList = parseRecipes(jsonItem['recipes']);

        return HistoryItem(
          jsonItem['id'],
          jsonItem['date'],
          recipesList,
        );
      }).toList();

      notifyListeners();
      print(_items);
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
