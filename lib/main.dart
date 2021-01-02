import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/recipes.dart';
import './screens/recipes_screen.dart';
import './screens/recipe_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Recipes(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: RecipesScreen(),
        initialRoute: '/',
        routes: {
          '/': (_) => RecipesScreen(),
          RecipeDetailScreen.routeName: (_) => RecipeDetailScreen()
        },
      ),
    );
  }
}
