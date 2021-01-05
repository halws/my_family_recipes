import 'package:flutter/material.dart';
import 'package:my_family_recipes/models/Recipe.dart';
import 'package:my_family_recipes/widgets/recipe-detail-screen-decorated-icon.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key key,
    @required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: GetDecoratedIcon(icon: Icons.keyboard_arrow_left),
        color: Colors.white,
        onPressed: () => Navigator.pop(context),
      ),
      elevation: 0,
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: GetDecoratedIcon(icon: Icons.add_shopping_cart),
        ),
      ],
      bottom: PreferredSize(
        child: Container(),
        preferredSize: Size(0, 20),
      ),
      pinned: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.4,
      flexibleSpace: Stack(
        children: [
          Positioned(
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  recipe.preview,
                ),
              ),
              top: 0,
              left: 0,
              right: 0,
              bottom: 0),
          Positioned(
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                // border: Border.all(width: 0),
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
            ),
            bottom: -1,
            left: 0,
            right: 0,
          ),
        ],
      ),
    );
  }
}
