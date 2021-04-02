import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_family_recipes/models/Recipe.dart';
import 'package:my_family_recipes/models/Basket_recipe.dart';

import 'package:my_family_recipes/providers/basket.dart';

import 'package:my_family_recipes/screens/basket/basket_screen.dart';

import 'package:my_family_recipes/widgets/recipe_detail_screen_decorated_icon.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key key,
    @required this.recipe,
    @required this.portions,
    @required this.resetPortions,
  }) : super(key: key);

  final Recipe recipe;
  final int portions;
  final Function resetPortions;

  @override
  Widget build(BuildContext context) {
    final basketProvider = Provider.of<Basket>(context, listen: false);

    void _addToBasket() {
      List<SubIngredient> subIngredients = recipe.ingredients
          .map((e) => SubIngredient(
                e.name,
                e.category,
                e.quantity,
                e.unit,
                parentId: recipe.id,
              ))
          .toList();

      final result = basketProvider.addItem(BasketItem(
        id: recipe.id,
        name: recipe.name,
        portions: portions,
        initialPortions: portions,
        ingredients: subIngredients,
      ));

      if (result) {
        final snackBar = SnackBar(
          content: Text('Рецепт додано до кошика!'),
          action: SnackBarAction(
            label: 'до кошика',
            onPressed: () =>
                Navigator.of(context).pushNamed(BasketScreen.routeName),
          ),
        );

        resetPortions();
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        // TODO доробити дію коли вже такий елемент є в кошику
        print('implement if already exist');
      }
    }

    return SliverAppBar(
      leading: IconButton(
        icon: GetDecoratedIcon(icon: Icons.keyboard_arrow_left),
        color: Colors.white,
        onPressed: () => Navigator.pop(context),
      ),
      elevation: 0,
      actions: <Widget>[
        IconButton(
          onPressed: () => _addToBasket(),
          icon: GetDecoratedIcon(icon: Icons.add_shopping_cart),
        ),
      ],
      bottom: PreferredSize(
        child: Container(),
        preferredSize: Size(0, 20),
      ),
      pinned: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.4,
      flexibleSpace: Stack(
        children: [
          Positioned(
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  recipe.preview,
                ),
              ),
              top: 0,
              left: 0,
              right: 0,
              bottom: 0),
          Positioned(
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                // border: Border.all(width: 0),
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
            ),
            bottom: -1,
            left: 0,
            right: 0,
          ),
        ],
      ),
    );
  }
}
