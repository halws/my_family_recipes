import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:my_family_recipes/models/Basket-recipe.dart';

class Basket with ChangeNotifier {
  List<BasketItem> _items = [];
  List<BasketItem> get items => [..._items];

  /// Adds [BasketItem] to cart.
  /// Returns true if item was not found in item instead false
  bool addItem(BasketItem item) {
    // check if item exist in elements
    var existingItem = items.firstWhere(
        (itemToCheck) => itemToCheck.id == item.id,
        orElse: () => null);

    if (existingItem != null) return false;

    _items.add(item);

    notifyListeners();
    return true;
  }

  void changePortion(BasketItem item, int portions) {
    item.changePortions(portions);

    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

/* ------------------------------ SubIngredients ----------------------------- */

  List<SubIngredient> _totalIgredients = [];
  List<SubIngredient> get totalIgredients => [..._totalIgredients];

  /// returns all ingredients from all recipes
  List<SubIngredient> get _fluttenIngredients {
    return _items.expand((e) => e.ingredients).toList();
  }

  /// groups all ingredients by name
  Map<String, List<SubIngredient>> groupIngredients() {
    final groups = groupBy(_fluttenIngredients, (SubIngredient e) {
      return e.name;
    });

    print(groups);
    return groups;
  }

  /// calculate all single ingredient's total quantity
  /// and set _totalIgredients value
  void generateTotalIngredients() {
    List<SubIngredient> _newIngredients = [];

    groupIngredients().forEach((key, ingredients) {
      final totalQuantity =
          ingredients.map((e) => e.totalQuantity).reduce((a, b) => a + b);

      final name = ingredients[0].name;
      final category = ingredients[0].category;
      final unit = ingredients[0].unit;

      _newIngredients.add(SubIngredient(name, category, totalQuantity, unit));
    });

    _totalIgredients = _newIngredients;
    notifyListeners();
  }

  /// Toggle ingredient checkbox
  void setIngredientCheckbox(SubIngredient ingredient, bool value) {
    ingredient.setCheckboxValue(value);

    notifyListeners();
  }
}
