import 'package:flutter/material.dart';

mixin ToggleIngredientsVisibility<T extends StatefulWidget> on State<T> {
  bool isSwitched = true;

  void toggleVisibility(bool visible) {
    print(visible);
    setState(() {
      isSwitched = visible;
    });
  }
}
