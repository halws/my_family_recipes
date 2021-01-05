import 'package:flutter/material.dart';
import 'package:my_family_recipes/models/Recipe.dart';
import 'package:my_family_recipes/utils/getColorFromHex.dart';
import 'package:my_family_recipes/utils/getTime.dart';

class RecipeHead extends StatelessWidget {
  final Recipe recipe;

  RecipeHead(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              recipe.name,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            child: Text(
              recipe.description,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Row(
                children: [
                  Text(
                    '${GetTime.durationToString(recipe.cookingTime)}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.query_builder,
                      color: Theme.of(context).accentColor,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  Text(
                    'Порцій: ${recipe.portions}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal:
                        BorderSide(color: ColorUtils.hexToColor('#EAF0F4'))),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      size: 20,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.people_outline,
                      size: 30,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove,
                      size: 20,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
