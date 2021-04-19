import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_family_recipes/models/History.dart';
import 'package:my_family_recipes/providers/history.dart';
import 'package:my_family_recipes/utils/get_color_from_hex.dart';
import 'package:my_family_recipes/widgets/app_bar_without_swither.dart';
import 'package:my_family_recipes/screens/details/details_screen.dart';

class HistoryItemScreen extends StatefulWidget {
  static const routeName = 'history-item-screen';
  @override
  _HistoryItemScreenState createState() => _HistoryItemScreenState();
}

class _HistoryItemScreenState extends State<HistoryItemScreen> {
  @override
  Widget build(BuildContext context) {
    final recipeId = ModalRoute.of(context).settings.arguments;
    final List<HistoryItem> history =
        Provider.of<History>(context, listen: false).items;

    HistoryItem recipesHistory =
        history.firstWhere((element) => element.id == recipeId);

    return Scaffold(
        backgroundColor: ColorUtils.hexToColor('#F8FBFE'),
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 110),
          child: AppBarWithoutSwitcher(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Рецепти з дня ${recipesHistory.date}",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: recipesHistory.recipes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 15.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  recipesHistory.recipes[index].name,
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                IconButton(
                                  icon: Icon(Icons.link),
                                  color: ColorUtils.hexToColor('#3a4470'),
                                  tooltip: 'Increase volume by 10',
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        DetailsScreen.routeName,
                                        arguments:
                                            recipesHistory.recipes[index].id);
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            decoration: BoxDecoration(
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: ColorUtils.hexToColor('#EAF0F4'))),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Порцій: ${recipesHistory.recipes[index].portions}',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: ColorUtils.hexToColor('#F3F5F9'),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: List<Padding>.generate(
                                  recipesHistory.recipes[index].ingredients
                                      .length, (subIngredientsIndex) {
                                final ingredient = recipesHistory.recipes[index]
                                    .ingredients[subIngredientsIndex];

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                      '${ingredient.name} ${ingredient.totalQuantity} ${ingredient.unit}'),
                                );
                              }),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        )));
  }
}
