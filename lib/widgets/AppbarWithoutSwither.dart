import 'package:flutter/material.dart';
import 'package:my_family_recipes/screens/home/components/appbar-creator.dart';
import 'package:my_family_recipes/utils/getColorFromHex.dart';
import 'package:my_family_recipes/widgets/recipe-detail-screen-decorated-icon.dart';

class AppBarWithoutSwitcher extends StatelessWidget {
  const AppBarWithoutSwitcher({
    Key key,
  }) : super(key: key);

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
          ]),
    );
  }
}
