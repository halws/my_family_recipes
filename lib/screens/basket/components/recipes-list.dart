import 'package:flutter/material.dart';
import 'package:my_family_recipes/models/Basket-recipe.dart';
import 'package:my_family_recipes/providers/basket.dart';
import 'package:my_family_recipes/screens/basket/components/recipe-ingredients.dart';
import 'package:my_family_recipes/utils/getColorFromHex.dart';
import 'package:provider/provider.dart';

class RecipesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final basketProvider = Provider.of<Basket>(context, listen: false);

    void _addPortions(BasketItem basketItem) {
      final int newPortions = basketItem.portions + basketItem.initialPortions;

      basketProvider.changePortion(basketItem, newPortions);
    }

    void _removePortions(BasketItem basketItem) {
      final int newPortions = basketItem.portions - basketItem.initialPortions;

      // check if value is not smaller than
      if (newPortions >= basketItem.initialPortions) {
        basketProvider.changePortion(basketItem, newPortions);
      }
    }

    return ListView.builder(
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
                    // RESIPE  TITLE
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
                          _addPortions(basketProvider.items[index]);
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
                          // PORTIONS
                          builder: (context, value, child) => Text(
                            'Порцій: ${value.items[index].portions}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _removePortions(basketProvider.items[index]);
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
                RecipeIngredients(basketProvider.items[index].ingredients)
              ],
            ),
          ),
        );
      },
    );
  }
}
