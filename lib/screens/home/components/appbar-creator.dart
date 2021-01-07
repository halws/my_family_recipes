import 'package:flutter/material.dart';
import 'package:my_family_recipes/utils/getColorFromHex.dart';

class AppbarCreator extends StatelessWidget {
  final Widget child;

  AppbarCreator({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: ColorUtils.hexToColor('#DADCE0'),
            blurRadius: 15.0,
            offset: Offset(0.0, 0.75))
      ]),
      width: MediaQuery.of(context).size.width,
      height: 110,
      child: Container(
        decoration: BoxDecoration(
            color: ColorUtils.hexToColor('#F3F5F9'),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 25),
            child: child,
          ),
        ),
      ),
    );
  }
}
