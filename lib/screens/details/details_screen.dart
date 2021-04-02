import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_family_recipes/screens/details/components/appbar.dart';
import 'package:my_family_recipes/screens/details/components/body_list.dart';
import 'package:my_family_recipes/screens/details/components/body.dart';

import 'package:my_family_recipes/models/Recipe.dart';
import 'package:my_family_recipes/providers/recipes.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = 'recipe-detail-screen';

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int portions = 1;
  var portionsMinimum;

  void updatePortions(int value) {
    if (value < portionsMinimum) return;
    print('updatePortions');
    setState(() {
      portions = value;
    });
  }

  void setInitialPortions(value) {
    if (portionsMinimum != null) return;
    print('setPortionsMinimum');
    portionsMinimum = value;
    portions = value;
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final List<Recipe> recipes =
        Provider.of<Recipes>(context, listen: false).items;

    Recipe recipe = recipes.firstWhere((element) => element.id == mealId);

// set inicial portion
    setInitialPortions(recipe.portions);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            child: DefaultTabController(
              length: 3, // leng
              child: new CustomScrollView(slivers: [
                Appbar(
                  recipe: recipe,
                  portions: portions,
                  resetPortions: () => updatePortions(portionsMinimum),
                ),
                BodyRoundedHead(),
                BodyList(
                    recipe: recipe,
                    updatePortions: updatePortions,
                    portions: portions),
              ]),
            ),
          ),
        ));
  }
}
