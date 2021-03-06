import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_family_recipes/providers/basket.dart';
import 'package:provider/provider.dart';

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Ні"),
    onPressed: () => Navigator.pop(context),
  );
  Widget continueButton = TextButton(
    child: Text("Так"),
    onPressed: () {
      final basketProvider = Provider.of<Basket>(context, listen: false);
      basketProvider.items.map((e) => print(jsonEncode(e)));
    },
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
