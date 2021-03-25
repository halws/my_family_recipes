import 'package:flutter/material.dart';
import 'package:my_family_recipes/screens/history/history_screen.dart';
import 'package:my_family_recipes/screens/home/components/simple-account-menu.dart';
import 'package:my_family_recipes/utils/getColorFromHex.dart';

import 'appbar-creator.dart';

List<Icon> icons = [
  Icon(Icons.person),
  Icon(Icons.settings),
  Icon(Icons.credit_card),
];

class Appbar extends StatelessWidget {
  const Appbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppbarCreator(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                      width: 2, color: ColorUtils.hexToColor('#E8EDF5')),
                )),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Впиши щоб знайти рецепт...',
                    hintStyle:
                        TextStyle(color: ColorUtils.hexToColor('#BACADD')),
                    contentPadding: EdgeInsets.only(top: 14),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: ColorUtils.hexToColor('#BACADD'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
                child: SimpleAccountMenu(
              backgroundColor: ColorUtils.hexToColor('#6D7492'),
              icons: [
                Icon(Icons.history),
              ],
              iconColor: Colors.white,
              onChange: (index) {
                print(index);
                switch (index) {
                  case 0:
                    Navigator.of(context).pushNamed(HistoryScreen.routeName);
                    break;
                  default:
                    return;
                }
              },
            )),
          ),
        ],
      ),
    );
  }
}
