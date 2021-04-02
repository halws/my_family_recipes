import 'package:flutter/material.dart';
import 'package:my_family_recipes/providers/basket.dart';
import 'package:my_family_recipes/providers/history.dart';
import 'package:provider/provider.dart';

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Ні"),
    onPressed: () {
      print(false);
      Navigator.pop(context);
    },
  );

  SnackBar snackBar = completeWithSnackbar(context);

  Widget continueButton = TextButton(
    child: Text("Так"),
    // TODO disable button when is loading
    onPressed: () async {
      final basketProvider = Provider.of<Basket>(context, listen: false);
      final historyProvider = Provider.of<History>(context, listen: false);
      try {
        await historyProvider.saveOrder(basketProvider.items);

        print('saveOrder');
        basketProvider.removeAll();
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } on Exception catch (e) {
        print(e);
      }
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

SnackBar completeWithSnackbar(BuildContext context) {
  final snackBar = SnackBar(
    content: Text('Історію записано!'),
    action: SnackBarAction(
      label: 'на головну',
      onPressed: () => Navigator.of(context)
          .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false),
    ),
  );
  return snackBar;
}
