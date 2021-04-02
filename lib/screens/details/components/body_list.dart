import 'package:flutter/material.dart';

import 'package:my_family_recipes/screens/details/components/recipe_head.dart';
import 'package:my_family_recipes/screens/details/components/recipe_tabs.dart';
import 'package:my_family_recipes/models/Recipe.dart';

class BodyList extends StatelessWidget {
  final Recipe recipe;
  final Function updatePortions;
  final int portions;

  BodyList({
    @required this.recipe,
    @required this.updatePortions,
    @required this.portions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          child: Column(
            children: [
              RecipeHead(recipe, portions, updatePortions),
              const SizedBox(height: 15),
              RecipeTabs(recipe.ingredients, recipe.cookingProcesses),
            ],
          ),
        )
      ]),
    );
  }
}
