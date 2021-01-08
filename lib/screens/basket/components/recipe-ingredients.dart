import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_family_recipes/models/Basket-recipe.dart';
import 'package:my_family_recipes/models/Recipe.dart';
import 'package:my_family_recipes/providers/basket.dart';
import 'package:my_family_recipes/screens/basket/components/labeled-checkbox.dart';
import 'package:my_family_recipes/utils/getColorFromHex.dart';

class RecipeIngredients extends StatelessWidget {
  final BasketItem basketItem;

  RecipeIngredients(this.basketItem);

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
          basketItem.ingredients.length,
          (index) => Consumer<Basket>(
            builder: (context, basketProvider, child) {
              final SubIngredient ingredient = basketItem.ingredients[index];
              return LabeledCheckbox(
                label:
                    '${ingredient.name} ${ingredient.totalQuantity} ${ingredient.unit}',
                value: basketItem.ingredients[index].checked,
                onChanged: (bool newValue) {
                  basketProvider.setSpecificItemsIngredientCheckbox(
                      basketItem.ingredients[index], newValue);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
