import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:my_family_recipes/models/Recipe.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'package:my_family_recipes/utils/getColorFromHex.dart';

class RecipeTabs extends StatelessWidget {
  final List<Ingredient> ingredients;
  final List<CookingProcess> cookingProcesses;

  RecipeTabs(this.ingredients, this.cookingProcesses);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2, // length of tabs
        initialIndex: 0,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TabBar(
                labelColor: ColorUtils.hexToColor('#3A4470'),
                indicatorWeight: 1,
                indicator: MaterialIndicator(
                  height: 3,
                  color: ColorUtils.hexToColor('#6C7492'),
                  topLeftRadius: 8,
                  topRightRadius: 8,
                  horizontalPadding: 50,
                  tabPosition: TabPosition.bottom,
                ),
                unselectedLabelColor: Theme.of(context).accentColor,
                tabs: [
                  Tab(text: 'Інгрідієнти'),
                  Tab(text: 'Приготування'),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorUtils.hexToColor('#F3F5F9'),
                  ),
                  child: TabBarView(children: <Widget>[
                    SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                            lipsum.createText(
                                numParagraphs: 10, numSentences: 5),
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text('Display Tab 2',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ]),
                ),
              ),
            ]),
      ),
    );
  }
}
