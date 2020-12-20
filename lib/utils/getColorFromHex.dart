import 'package:flutter/material.dart';

class ColorUtils {
  // Color _getColorFromHex(String hexColor) {
  //   hexColor = hexColor.replaceAll("#", "");
  //   if (hexColor.length == 6) {
  //     hexColor = "FF" + hexColor;
  //   }
  //   if (hexColor.length == 8) {
  //     return Color(int.parse("0x$hexColor"));
  //   }
  // }

  ///
  /// Converts the given [hex] color string to the corresponding olor.
  ///
  /// Note that when no alpha/opacity is specified, 0xFF is assumed.
  ///
  static Color hexToColor(String hex) {
    final hexDigits = hex.startsWith('#') ? hex.substring(1) : hex;
    final hexMask = hexDigits.length <= 6 ? 0xFF000000 : 0;
    final hexValue = int.parse(hexDigits, radix: 16);
    assert(hexValue >= 0 && hexValue <= 0xFFFFFFFF);
    return Color(hexValue | hexMask);
  }
}
