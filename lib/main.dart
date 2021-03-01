import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_family_recipes/screens/basket/basket_screen.dart';
import 'package:provider/provider.dart';

import 'package:my_family_recipes/utils/getColorFromHex.dart';

import 'package:my_family_recipes/providers/recipes.dart';
import 'package:my_family_recipes/providers/basket.dart';

import 'package:my_family_recipes/screens/home/home_screen.dart';
import 'package:my_family_recipes/screens/details/details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Recipes()),
          ChangeNotifierProvider(create: (context) => Basket())
        ],
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            accentColor: ColorUtils.hexToColor('#96ABB5'),
            primaryColor: ColorUtils.hexToColor('#F3F5F9'),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: ColorUtils.hexToColor('#96ABB5'),
              ),
            ),
            textTheme: TextTheme(
              headline1: TextStyle(
                fontSize: 18,
                color: ColorUtils.hexToColor('#3A4470'),
                fontWeight: FontWeight.bold,
              ),
              headline2: TextStyle(
                fontSize: 18,
                color: ColorUtils.hexToColor('#3A4470'),
                fontWeight: FontWeight.bold,
              ),
              bodyText1: TextStyle(
                  fontSize: 14, color: ColorUtils.hexToColor('#678694')),
            ),
            primarySwatch: ColorUtils.createMaterialColor(
                ColorUtils.hexToColor('#F3F5F9')),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          routes: {
            '/': (_) => HomeScreen(),
            DetailsScreen.routeName: (_) => DetailsScreen(),
            BasketScreen.routeName: (_) => BasketScreen(),
          },
        ),
      ),
    );
  }
}
