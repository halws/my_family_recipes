import 'package:flutter/material.dart';

import 'package:my_family_recipes/screens/details/components/recipe-head.dart';
import 'package:my_family_recipes/screens/details/components/recipe-tabs.dart';
import 'package:my_family_recipes/models/Recipe.dart';

class BodyList extends StatelessWidget {
  final Recipe recipe;

  BodyList(this.recipe);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          child: Column(
            children: [
              RecipeHead(recipe),
              const SizedBox(height: 15),
              RecipeTabs(recipe.ingredients, recipe.cookingProcesses),
            ],
          ),
        )
      ]),
    );
  }
}
