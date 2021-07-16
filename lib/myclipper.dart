import 'package:flutter/cupertino.dart';

class CircleRevealClipper extends CustomClipper<Rect> {
  CircleRevealClipper();

  @override
  Rect getClip(Size size) {
    final epicenter = new Offset(size.width, size.height);

    // Calculate distance from epicenter to the top left corner to make sure clip the image into circle.

    final distanceToCorner = epicenter.dy;

    final radius = distanceToCorner;
    final diameter = radius;

    return new Rect.fromLTWH(0, 13, 200, 200);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
