import 'package:my_family_recipes/models/Basket-recipe.dart';

class HistoryItem {
  final String id;
  final String date;
  final List<BasketItem> recipes;

  HistoryItem(this.id, this.date, this.recipes);
}
