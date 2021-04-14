import 'package:flutter/material.dart';

import 'package:my_family_recipes/mixins/toggle_Ingredients_visibility_mixin.dart';
import 'package:my_family_recipes/utils/get_color_from_hex.dart';

import 'package:my_family_recipes/screens/basket/components/app_bar_with_swither.dart';
import 'package:my_family_recipes/screens/basket/components/recipes_list.dart';
import 'package:my_family_recipes/screens/basket/components/clear_basket_dialog.dart';
import 'package:my_family_recipes/screens/basket/components/ingredients_list.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAlertDialog(context),
        child: Icon(Icons.assignment_turned_in),
        backgroundColor: ColorUtils.hexToColor('#F3F5F9'),
      ),
    );
  }
}
