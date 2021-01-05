import 'package:flutter/material.dart';
import 'package:my_family_recipes/utils/getColorFromHex.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key key,
  }) : super(key: key);

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
                          hintStyle: TextStyle(
                              color: ColorUtils.hexToColor('#BACADD')),
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
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/men/65.jpg"),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
