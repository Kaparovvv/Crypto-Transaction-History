import 'package:flutter/cupertino.dart';

class WidgetHelper {
  ImageIcon imageIcon(
    String imageName,
    Color color,
    double size,
  ) {
    return ImageIcon(
      AssetImage(imageName),
      size: size,
      color: color,
    );
  }
}
