import 'package:flutter/material.dart';
import 'package:my_family_recipes/mixins/ToggleIngredientsVisibilityMixin.dart';
import 'package:my_family_recipes/providers/history.dart';
import 'package:my_family_recipes/screens/basket/components/toggle-ingredients-visibility.dart';
import 'package:my_family_recipes/utils/getColorFromHex.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  static const routeName = 'history-screen';

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with ToggleIngredientsVisibility {
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<History>(context).fetchAndSetOrders();
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.hexToColor('#F8FBFE'),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 110),
        child: AppBarWithSwitcher(
          isSwitched: isSwitched,
          toggleVisibility: toggleVisibility,
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Text('zzzzzzzz'),
        ),
      ),
    );
  }
}
