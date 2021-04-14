import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';

import 'package:my_family_recipes/models/Basket_recipe.dart';
import 'package:my_family_recipes/models/History.dart';

import 'package:my_family_recipes/utils/db_helper.dart';

List<HistoryItem> parseRecipes(List<Map<String, dynamic>> dataList) {
  // final recipes = jsonDecode(json).cast<List<dynamic>>();

  return dataList.map((jsonItem) {
    // transform recipes
    // print(jsonDecode(jsonItem['recipes']));
    // print(recipes.runtimeType);

    final recipes = jsonDecode(jsonItem['recipes']) as List;
    List<BasketItem> recipesList =
        recipes.map<BasketItem>((e) => BasketItem.fromJson(e)).toList();

    return HistoryItem(
      jsonItem['id'],
      jsonItem['date'],
      recipesList,
    );
  }).toList();
}

class History with ChangeNotifier {
  List<HistoryItem> _items = [];
  List<HistoryItem> get items => [..._items];

  Future<List<HistoryItem>> _fetchOrders() async {
    final dbResponse = await DBHelper.getData('orders');

    /// Use the compute function to run parseRecipes in a separate isolate.
    return compute(parseRecipes, dbResponse);
  }

  Future<void> setOrders() async {
    try {
      print("_fetchOrders()");
      _items = await _fetchOrders();
      notifyListeners();
      print(_items);
    } on Exception catch (e) {
      // TODO
      print('Exception catch');
      print(e);
    }
  }

  Future<void> saveOrder(List<BasketItem> items) async {
    var dt = DateTime.now();
    final uuid = Uuid();
    var newFormat = DateFormat("dd-MM-yy");
    String updatedDt = newFormat.format(dt);

    var data = {
      'id': uuid.v1(),
      'date': updatedDt,
      'recipes': jsonEncode(items),
    };

    print(data);
    await DBHelper.insert('orders', data);
  }
}
