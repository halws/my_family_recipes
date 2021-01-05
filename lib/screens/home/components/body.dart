import 'package:flutter/material.dart';

import 'package:my_family_recipes/screens/details/details_screen.dart';
import 'package:my_family_recipes/utils/getColorFromHex.dart';

class Body extends StatelessWidget {
  final List items;

  Body(this.items);

  selectMeal(BuildContext context, String id) {
    Navigator.of(context).pushNamed(DetailsScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return items.length > 0
        ? ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => selectMeal(context, items[index].id),
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      15, 30, 15, index == items.length - 1 ? 30 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          items[index].preview,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index].name,
                              style: TextStyle(
                                color: ColorUtils.hexToColor('#636A8A'),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0)),
                            Text(
                              items[index].description,
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorUtils.hexToColor('#B2C1C9'),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: true,
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0)),
                            Text(
                              '${items[index].portions} порції',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorUtils.hexToColor('#B2C1C9'),
                              ),
                              softWrap: true,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        : Center(child: const Text('Немає рецептів'));
  }
}
