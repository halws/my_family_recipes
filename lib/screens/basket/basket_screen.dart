import 'package:flutter/material.dart';
import 'package:my_family_recipes/models/Basket-recipe.dart';
import 'package:my_family_recipes/screens/basket/components/linked-label-switch.dart';
import 'package:my_family_recipes/screens/basket/components/recipe-ingredients.dart';
import 'package:provider/provider.dart';

import 'package:my_family_recipes/screens/home/components/appbar-creator.dart';
import 'package:my_family_recipes/utils/getColorFromHex.dart';
import 'package:my_family_recipes/widgets/recipe-detail-screen-decorated-icon.dart';
import 'package:my_family_recipes/providers/basket.dart';

class BasketScreen extends StatefulWidget {
  static const routeName = 'basket-screen';

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final basketProvider = Provider.of<Basket>(context, listen: false);

    void removePortions(BasketItem basketItem) {
      final int newPortions = basketItem.portions - basketItem.initialPortions;

      // check if value is not smaller than
      if (newPortions >= basketItem.initialPortions) {
        basketProvider.changePortionsOnSpecificItem(basketItem.id, newPortions);
      }
    }

    void addPortions(BasketItem basketItem) {
      final int newPortions = basketItem.portions + basketItem.initialPortions;

      basketProvider.changePortionsOnSpecificItem(basketItem.id, newPortions);
    }

    return Scaffold(
      backgroundColor: ColorUtils.hexToColor('#F8FBFE'),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 110),
        child: AppbarCreator(
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: double.infinity,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: GetDecoratedIcon(
                      icon: Icons.keyboard_arrow_left,
                      color: ColorUtils.hexToColor('#3A4470'),
                    ),
                  ),
                ),
                LinkedLabelSwitch(
                  label: 'Поділ на страви',
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  value: isSwitched,
                  onChanged: (bool newValue) {
                    setState(() {
                      isSwitched = newValue;
                    });
                  },
                )
              ]),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: basketProvider.items.length,
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
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              basketProvider.items[index].name,
                              textAlign: TextAlign.right,
                              style: Theme.of(context).textTheme.headline1,
                            ),
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
                              IconButton(
                                onPressed: () {
                                  addPortions(basketProvider.items[index]);
                                },
                                icon: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Consumer<Basket>(
                                  builder: (context, value, child) => Text(
                                    'Порцій: ${value.items[index].portions}',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  removePortions(basketProvider.items[index]);
                                },
                                icon: Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RecipeIngredients(basketProvider.items[index])
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.assignment_turned_in),
        backgroundColor: ColorUtils.hexToColor('#F3F5F9'),
      ),
    );
  }
}
