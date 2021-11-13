import 'package:flutter/material.dart';

abstract class BorderRadiuses {
  // all
  static const BorderRadius all16 = BorderRadius.all(Radius.circular(16.0));

  // top
  // static const BorderRadius top24 = BorderRadius.vertical(top: Radius.circular(24.0));

  // other
  static const BorderRadius diagonal10And40 = BorderRadius.only(
    topLeft: Radius.circular(10.0),
    bottomRight: Radius.circular(10.0),
    topRight: Radius.circular(40.0),
    bottomLeft: Radius.circular(40.0),
  );
}
