import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';

class GetDecoratedIcon extends StatelessWidget {
  const GetDecoratedIcon({Key key, @required this.icon}) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return DecoratedIcon(
      icon,
      color: Colors.white,
      size: 26.0,
      shadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          offset: Offset(2.0, 2.0),
        ),
      ],
    );
  }
}
