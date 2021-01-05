import 'package:flutter/material.dart';

class CookingProcess {
  final String description;
  final List<String> images;

  CookingProcess({this.description, this.images});

  factory CookingProcess.fromJson(Map<String, dynamic> json) {
    var imagesFromJson = json['images'];
    return CookingProcess(
      description: json['description'],
      images: new List<String>.from(imagesFromJson),
    );
  }
}

class Ingredient {
  final String name;

  final String category;
  final int quantity;
  final String unit;

  Ingredient({
    @required this.name,
    this.category,
    @required this.quantity,
    @required this.unit,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      category: json['category'],
      quantity: json['quantity'],
      unit: json['unit'],
    );
  }
}

class Recipe {
  final String id;
  final String name;
  final String description;
  final int portions;
  final int cookingTime;
  final String preview;

  final List<CookingProcess> cookingProcesses;
  final List<Ingredient> ingredients;

  Recipe({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.portions,
    @required this.cookingTime,
    @required this.preview,
    @required this.cookingProcesses,
    @required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    // transform cookingProcesses
    var cookingProcessesListDecoded = json['cooking_process'] as List;
    List<CookingProcess> cookingProcessesList = cookingProcessesListDecoded
        .map((e) => CookingProcess.fromJson(e))
        .toList();

    // transform ingredients
    var ingredientsListDecoded = json['ingredients'] as List;
    List<Ingredient> ingredientsList =
        ingredientsListDecoded.map((e) => Ingredient.fromJson(e)).toList();

    return Recipe(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      portions: json['portions'],
      cookingTime: json['cooking_time'],
      preview: json['preview'],
      cookingProcesses: cookingProcessesList,
      ingredients: ingredientsList,
    );
  }
}
