import 'package:flutter/material.dart';
import 'package:my_family_recipes/models/Recipe.dart';

class SubIngredient extends Ingredient {
  bool checked = false;
  int totalQuantity;
  final String parentId;

  SubIngredient(name, category, quantity, unit,
      {this.parentId, int portions = 1})
      : totalQuantity = portions * quantity,
        super(name: name, category: category, quantity: quantity, unit: unit);

  void setTotalQuantity(int portions) =>
      this.totalQuantity = portions * super.quantity;

  void setCheckboxValue(bool value) => checked = value;

  Map<String, dynamic> toJson() {
    return {
      "totalQuantity": totalQuantity,
      "parentId": parentId,
    };
  }
}

class SingleIngredient extends SubIngredient {
  final List<String> ids;

  SingleIngredient(
    name,
    category,
    quantity,
    unit,
    this.ids, {
    int portions = 1,
  }) : super(name, category, quantity, unit, portions: portions);
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

  Map<String, dynamic> toJson() {
    List<Map> ingredients = this.ingredients != null
        ? this.ingredients.map((e) => e.toJson()).toList()
        : null;

    return {
      'id': id,
      'name': name,
      "portions": portions,
      "ingredients": ingredients
    };
  }

  factory BasketItem.fromJson(Map<String, dynamic> json) {
    // transform ingredients
    var ingredientsListDecoded = json['ingredients'] as List;
    List<Ingredient> ingredientsList =
        ingredientsListDecoded.map((e) => Ingredient.fromJson(e)).toList();

    return BasketItem(
      id: json['id'],
      name: json['name'],
      initialPortions: 1,
      portions: json['portions'],
      ingredients: ingredientsList,
    );
  }
}
