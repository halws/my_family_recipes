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

    /// This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void toggleIngredientCheckboxForAllRecipes(
      SingleIngredient toggledIngredient, bool value) {
    toggledIngredient.ids.forEach((id) {
      /// find specific ingredient
      final theIngredient = _items
          .firstWhere((item) => item.id == id)
          .ingredients
          .firstWhere(
              (ingredient) => ingredient.name == toggledIngredient.name);

      /// toggle it's value
      setIngredientCheckbox(theIngredient, value);
    });
  }

/* ------------------------------- Ingredient ------------------------------- */
  /// Toggle ingredient checkbox
  void setIngredientCheckbox(SubIngredient ingredient, bool value) {
    ingredient.setCheckboxValue(value);

    notifyListeners();
  }

/* ------------------------------ SingleIngredient ----------------------------- */

  List<SingleIngredient> _totalIgredients = [];
  List<SingleIngredient> get totalIgredients => [..._totalIgredients];

  /// returns all ingredients from all recipes
  List<SubIngredient> get _fluttenIngredients {
    print('basket.dart: _fluttenIngredients');
    return _items.expand((e) => e.ingredients).toList();
  }

  /// groups all ingredients by name
  Map<String, List<SubIngredient>> groupIngredients() {
    print('basket.dart: group ingredients');

    final groups = groupBy(_fluttenIngredients, (SubIngredient e) {
      return e.name;
    });

    return groups;
  }

  /// calculate all single ingredient's total quantity
  /// and set _totalIgredients value
  void generateTotalIngredients() {
    print(
      'basket.dart: generate total ingredients',
    );
    List<SingleIngredient> _ingredients = [];

    groupIngredients().forEach((key, ingredients) {
      final totalQuantity =
          ingredients.map((e) => e.totalQuantity).reduce((a, b) => a + b);
      final List<String> ids = ingredients.map((e) => '${e.parentId}').toList();
      final name = ingredients[0].name;
      final category = ingredients[0].category;
      final unit = ingredients[0].unit;

      final newSubIngredient =
          new SingleIngredient(name, category, totalQuantity, unit, ids);

      /// if all ingredients are checked then set check to true
      if (!ingredients.map((e) => e.checked).contains(false)) {
        newSubIngredient.setCheckboxValue(true);
      }

      _ingredients.add(newSubIngredient);
    });

    _totalIgredients = _ingredients;
  }

  /// Toggle ingredient checkbox
  void setSingleIngredientCheckbox(SingleIngredient ingredient, bool value) {
    ingredient.setCheckboxValue(value);

    notifyListeners();
  }
}
