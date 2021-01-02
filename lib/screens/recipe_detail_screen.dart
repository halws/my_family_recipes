import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:decorated_icon/decorated_icon.dart';

import '../widgets/recipe-detail-screen-decorated-icon.dart';
import '../models/Recipe.dart';
import '../providers/recipes.dart';

class RecipeDetailScreen extends StatefulWidget {
  static const routeName = 'recipe-detail-page';

  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final List<Recipe> recipes = Provider.of<Recipes>(context).items;

    Recipe recipe = recipes.firstWhere((element) => element.id == mealId);

    return Scaffold(
        body: new CustomScrollView(slivers: [
      SliverAppBar(
        leading: IconButton(
          icon: GetDecoratedIcon(icon: Icons.keyboard_arrow_left),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
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
      ),
      SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: Colors.white,
          ),
          height: 1000,
          child: Center(
            child: Text('Main content here'),
          ),
        ),
      ),
    ]));
  }
}
