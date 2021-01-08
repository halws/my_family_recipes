import 'package:flutter/material.dart';
import 'package:my_family_recipes/models/Basket-recipe.dart';

class Basket with ChangeNotifier {
  List<BasketItem> _items = [];

  List<BasketItem> get items => [..._items];

  /// Adds [item] to cart.
  /// Returns true if item was not found in item instead false
  bool addItem(BasketItem item) {
    // check if item exist in elements
    var existingItem = items.firstWhere(
        (itemToCheck) => itemToCheck.id == item.id,
        orElse: () => null);

    if (existingItem != null) return false;

    _items.add(item);

    notifyListeners();
    print(items);
    return true;
  }

  void changePortionsOnSpecificItem(String id, int portions) {
    _items.firstWhere((element) => element.id == id).changePortions(portions);

    notifyListeners();
  }

  SubIngredient getSpecificItemsIngredient(String id, String name) {
    return _items
        .firstWhere((element) => element.id == id)
        .ingredients
        .firstWhere((element) => element.name == name);
  }

  void setSpecificItemsIngredientCheckbox(
      SubIngredient ingredient, bool value) {
    ingredient.setCheckboxValue(value);

    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
