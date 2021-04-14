import 'package:flutter/material.dart';

class HistoryItemScreen extends StatefulWidget {
  static const routeName = 'history-item-screen';
  @override
  _HistoryItemScreenState createState() => _HistoryItemScreenState();
}

class _HistoryItemScreenState extends State<HistoryItemScreen> {
  @override
  Widget build(BuildContext context) {
    final recipeId = ModalRoute.of(context).settings.arguments;

    return Container(
      child: Text('history_item_screen $recipeId'),
    );
  }
}
