import 'package:flutter/material.dart';
import 'package:my_family_recipes/models/Recipe.dart';

class SubIngredient extends Ingredient {
  bool checked = false;

  SubIngredient(name, category, quantity, unit)
      : super(
          name: name,
          category: category,
          quantity: quantity,
          unit: unit,
        );

  int getTotalQuantity(int portions) {
    return portions * super.quantity;
  }

  void setChecked() {
    checked = true;
  }

  void setUnchacked() {
    checked = false;
  }
}

class BasketItem {
  final String id;
  final String name;
  int portions;
  final List<SubIngredient> ingredients;

  BasketItem({
    @required this.id,
    @required this.name,
    @required this.portions,
    @required this.ingredients,
  });

  void changePortions(int newQuantity) {
    this.portions = newQuantity;
  }

  List<Map<String, dynamic>> get ingredientsWithTotalValues {
    return ingredients.map((e) {
      return {
        'ingredient': e,
        'totalQuantity': e.getTotalQuantity(portions),
      };
    }).toList();
  }
}
