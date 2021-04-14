import 'package:flutter/material.dart';
import 'package:my_family_recipes/screens/home/components/appbar_creator.dart';
import 'package:my_family_recipes/utils/get_color_from_hex.dart';
import 'package:my_family_recipes/widgets/recipe_detail_screen_decorated_icon.dart';

class AppBarWithoutSwitcher extends StatelessWidget {
  const AppBarWithoutSwitcher({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppbarCreator(
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
            child != null ? child : Container()
          ]),
    );
  }
}
