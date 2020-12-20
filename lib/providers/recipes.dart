import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import '../models/Recipe.dart';

Future<String> loadRecipes() async {
  String recipes;

  try {
    recipes = await rootBundle.loadString('assets/recipes.json');
  } catch (e) {
    print(e);
  }

  return recipes;
}

class Recipes with ChangeNotifier {
  List<Recipe> _items = [];

  List<Recipe> get items {
    return [..._items];
  }

  List<Recipe> parseRecipes(String json) {
    final parsed = jsonDecode(json).cast<String, dynamic>();
    // print(parsed['recipes'].runtimeType);
    final recipes = parsed['recipes'] as List;

    return recipes.map<Recipe>((e) => Recipe.fromJson(e)).toList();
  }

  Future<void> fetchAndSetRecipes() async {
    try {
      final recipesListString = await loadRecipes();

      _items = parseRecipes(recipesListString);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
