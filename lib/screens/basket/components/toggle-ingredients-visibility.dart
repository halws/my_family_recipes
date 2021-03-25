import 'package:flutter/material.dart';
import 'package:my_family_recipes/screens/basket/components/linked-label-switch.dart';
import 'package:my_family_recipes/screens/home/components/appbar-creator.dart';
import 'package:my_family_recipes/utils/getColorFromHex.dart';
import 'package:my_family_recipes/widgets/recipe-detail-screen-decorated-icon.dart';

class AppBarWithSwitcher extends StatelessWidget {
  const AppBarWithSwitcher({
    Key key,
    @required this.toggleVisibility,
    @required this.isSwitched,
  }) : super(key: key);

  final bool isSwitched;
  final Function toggleVisibility;
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
            LinkedLabelSwitch(
              label: isSwitched ? 'Поділ на інгредієнти' : 'Поділ на страви',
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: isSwitched,
              onChanged: (bool newValue) {
                toggleVisibility(newValue);
              },
            )
          ]),
    );
  }
}
