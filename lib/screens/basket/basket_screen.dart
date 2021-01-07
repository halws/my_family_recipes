import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_family_recipes/screens/home/components/appbar-creator.dart';
import 'package:my_family_recipes/utils/getColorFromHex.dart';
import 'package:my_family_recipes/widgets/recipe-detail-screen-decorated-icon.dart';

class BasketScreen extends StatefulWidget {
  static const routeName = 'basket-screen';

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class LinkedLabelSwitch extends StatelessWidget {
  const LinkedLabelSwitch({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            label,
            style: Theme.of(context).textTheme.headline1,
          ),
          Flexible(
            child: Switch(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BasketScreenState extends State<BasketScreen> {
  bool isSwitched = false;

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
                  label: 'Поділ на страви',
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
        child: Container(
          alignment: Alignment.center,
          child: Text('wtf'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.assignment_turned_in),
        backgroundColor: ColorUtils.hexToColor('#F3F5F9'),
      ),
    );
  }
}
