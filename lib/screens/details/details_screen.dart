import 'package:flutter/material.dart';
import 'package:my_family_recipes/screens/details/components/appbar.dart';
import 'package:my_family_recipes/screens/details/components/body-list.dart';
import 'package:my_family_recipes/screens/details/components/body.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:provider/provider.dart';

import 'package:my_family_recipes/utils/getColorFromHex.dart';
import '../../models/Recipe.dart';
import '../../providers/recipes.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = 'recipe-detail-page';

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final List<Recipe> recipes = Provider.of<Recipes>(context).items;

    Recipe recipe = recipes.firstWhere((element) => element.id == mealId);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: DefaultTabController(
            length: 3, // leng
            child: new CustomScrollView(slivers: [
              Appbar(recipe: recipe),
              BodyRoundedHead(),
              BodyList(recipe),
            ]),
          ),
        ));
  }
}
