import 'package:flutter/material.dart';
import 'package:my_family_recipes/models/Recipe.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:my_family_recipes/utils/get_color_from_hex.dart';

class RecipeTabs extends StatelessWidget {
  final List<Ingredient> ingredients;
  final List<CookingProcess> cookingProcesses;

  RecipeTabs(this.ingredients, this.cookingProcesses);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2, // length of tabs
        initialIndex: 0,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TabBar(
                labelColor: ColorUtils.hexToColor('#3A4470'),
                indicatorWeight: 1,
                indicator: MaterialIndicator(
                  height: 3,
                  color: ColorUtils.hexToColor('#6C7492'),
                  topLeftRadius: 8,
                  topRightRadius: 8,
                  horizontalPadding: 50,
                  tabPosition: TabPosition.bottom,
                ),
                unselectedLabelColor: Theme.of(context).accentColor,
                tabs: [
                  Tab(text: 'Інгрідієнти'),
                  Tab(text: 'Приготування'),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: ColorUtils.hexToColor('#F3F5F9'),
                ),
                child: TabBarView(children: <Widget>[
                  TabIngredients(ingredients: ingredients),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: cookingProcesses.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 200.0,
                                enableInfiniteScroll: false,
                                viewportFraction: .95,
                              ),
                              items: cookingProcesses[index].images.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      margin: cookingProcesses[index]
                                                  .images
                                                  .length >
                                              0
                                          ? EdgeInsets.only(right: 5.0)
                                          : EdgeInsets.all(0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          cookingProcesses[index].images[0],
                                          height: 200,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(cookingProcesses[index].description,
                                  style: Theme.of(context).textTheme.bodyText1),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        height: 36,
                        thickness: 1,
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
      ),
    );
  }
}

class TabIngredients extends StatelessWidget {
  const TabIngredients({
    Key key,
    @required this.ingredients,
  }) : super(key: key);

  final List<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: ingredients
              .map((ingredient) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.fiber_manual_record,
                          size: 8,
                          color: ColorUtils.hexToColor('#678694'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                              '${ingredient.name} ${ingredient.quantity} ${ingredient.unit}',
                              style: Theme.of(context).textTheme.bodyText1),
                        )
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
