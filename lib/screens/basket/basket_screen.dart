import 'package:flutter/material.dart';
import 'package:my_family_recipes/mixins/ToggleIngredientsVisibilityMixin.dart';

import 'package:my_family_recipes/screens/basket/components/recipes-list.dart';
import 'package:my_family_recipes/screens/basket/components/clear-basket-dialog.dart';
import 'package:my_family_recipes/screens/basket/components/ingredients-list.dart';
import 'package:my_family_recipes/screens/basket/components/toggle-ingredients-visibility.dart';

import 'package:my_family_recipes/utils/getColorFromHex.dart';

class BasketScreen extends StatefulWidget {
  static const routeName = 'basket-screen';

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen>
    with ToggleIngredientsVisibility {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.hexToColor('#F8FBFE'),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 110),
        child: AppBarWithSwitcher(
          isSwitched: isSwitched,
          toggleVisibility: toggleVisibility,
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: isSwitched ? IngredientsList() : RecipesList(),
          )
        ],
      )),
      // TODO show this button only when there are few elements in the list
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAlertDialog(context),
        child: Icon(Icons.assignment_turned_in),
        backgroundColor: ColorUtils.hexToColor('#F3F5F9'),
      ),
    );
  }
}
