import 'package:flutter/material.dart';
import 'package:my_family_recipes/models/Recipe.dart';

class SubIngredient extends Ingredient {
  bool checked = false;
  int totalQuantity;

  SubIngredient(name, category, quantity, unit, [int portions = 1])
      : totalQuantity = portions * quantity,
        super(
          name: name,
          category: category,
          quantity: quantity,
          unit: unit,
        );

  void setTotalQuantity(int portions) =>
      this.totalQuantity = portions * super.quantity;

  void setCheckboxValue(bool value) => checked = value;
}

class BasketItem {
  final String id;
  final String name;
  final int initialPortions;
  int portions;
  final List<SubIngredient> ingredients;

  BasketItem({
    @required this.id,
    @required this.name,
    @required this.portions,
    @required this.initialPortions,
    @required this.ingredients,
  }) {
    this.changePortions(portions);
  }

  /// change portions and recalculate all ingredients values
  void changePortions(int portions) {
    this.portions = portions;

    ingredients.forEach((SubIngredient ingredient) {
      ingredient.setTotalQuantity(this.portions);
    });
  }
}
