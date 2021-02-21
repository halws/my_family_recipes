import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_family_recipes/models/Basket-recipe.dart';
import 'package:my_family_recipes/providers/basket.dart';
import 'package:my_family_recipes/screens/basket/components/labeled-checkbox.dart';
import 'package:my_family_recipes/utils/getColorFromHex.dart';

/// Show list of ingredinets on grey background
class RecipeIngredients extends StatelessWidget {
  final List<SubIngredient> ingredients;
  final Function toggleCheckbox;

  RecipeIngredients(this.ingredients, this.toggleCheckbox);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorUtils.hexToColor('#F3F5F9'),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List<Consumer<Basket>>.generate(
          ingredients.length,
          (index) => Consumer<Basket>(
            builder: (context, basketProvider, child) {
              final SubIngredient ingredient = ingredients[index];
              return LabeledCheckbox(
                label:
                    '${ingredient.name} ${ingredient.totalQuantity} ${ingredient.unit}',
                value: ingredients[index].checked,
                onChanged: (bool newValue) {
                  toggleCheckbox(index, newValue);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
