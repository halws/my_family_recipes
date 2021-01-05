import 'package:flutter/material.dart';

class BodyRoundedHead extends StatelessWidget {
  const BodyRoundedHead({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.white,
        ),
      ),
    );
  }
}
