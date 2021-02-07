import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_family_recipes/screens/basket/components/recipe-ingredients.dart';
import 'package:my_family_recipes/providers/basket.dart';

class IngredientsList extends StatefulWidget {
  @override
  _IngredientsListState createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  @override
  void didChangeDependencies() {
    Provider.of<Basket>(context).generateTotalIngredients();
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Basket>(
      builder: (context, basketProvider, child) =>
          RecipeIngredients(basketProvider.totalIgredients),
    );
  }
}
