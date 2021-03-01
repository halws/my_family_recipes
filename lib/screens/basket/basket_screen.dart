import 'package:flutter/material.dart';
import 'package:my_family_recipes/screens/basket/components/ingredients-list.dart';

import 'package:my_family_recipes/screens/basket/components/recipes-list.dart';
import 'package:my_family_recipes/screens/basket/components/linked-label-switch.dart';
import 'package:my_family_recipes/screens/home/components/appbar-creator.dart';

import 'package:my_family_recipes/widgets/recipe-detail-screen-decorated-icon.dart';

import 'package:my_family_recipes/utils/getColorFromHex.dart';

class BasketScreen extends StatefulWidget {
  static const routeName = 'basket-screen';

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Ні"),
    onPressed: () => Navigator.pop(context),
  );
  Widget continueButton = TextButton(
    child: Text("Так"),
    onPressed: () {},
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Вичистити кошик"),
    content: Text("Чи вичистити кошик і записати в історії покупок?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class _BasketScreenState extends State<BasketScreen> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.hexToColor('#F8FBFE'),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 110),
        child: AppbarCreator(
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: double.infinity,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: GetDecoratedIcon(
                      icon: Icons.keyboard_arrow_left,
                      color: ColorUtils.hexToColor('#3A4470'),
                    ),
                  ),
                ),
                LinkedLabelSwitch(
                  label:
                      isSwitched ? 'Поділ на інгредієнти' : 'Поділ на страви',
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  value: isSwitched,
                  onChanged: (bool newValue) {
                    setState(() {
                      isSwitched = newValue;
                    });
                  },
                )
              ]),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: isSwitched ? IngredientsList() : RecipesList(),
          )
        ],
      )),
      // TODO show this button only when there are few elements in the list
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAlertDialog(context),
        child: Icon(Icons.assignment_turned_in),
        backgroundColor: ColorUtils.hexToColor('#F3F5F9'),
      ),
    );
  }
}
