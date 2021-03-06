import 'package:flutter/material.dart';
import 'package:my_family_recipes/providers/basket.dart';
import 'package:my_family_recipes/screens/basket/basket_screen.dart';
import 'package:my_family_recipes/screens/home/components/appbar.dart';
import 'package:my_family_recipes/screens/home/components/body.dart';

import 'package:my_family_recipes/utils/get_color_from_hex.dart';
import 'package:provider/provider.dart';

import 'package:my_family_recipes/providers/recipes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Recipes>(context).fetchAndSetRecipes();
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO refactor to futureBuilder
    final items = Provider.of<Recipes>(context).items;

    return Scaffold(
      backgroundColor: ColorUtils.hexToColor('#F8FBFE'),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 110),
        child: Appbar(),
      ),
      body: SafeArea(child: Body(items)),
      floatingActionButton: Consumer<Basket>(
        builder: (context, value, child) {
          return value.items.length > 0
              ? FloatingActionButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(BasketScreen.routeName),
                  child: Icon(Icons.receipt_long),
                  backgroundColor: ColorUtils.hexToColor('#F3F5F9'),
                )
              : Container();
        },
      ),
    );
  }
}
