import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  Widget padding({EdgeInsets padding = EdgeInsets.zero}) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }

  Widget paddingSymetric({
    double h = 0,
    double v = 0,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: h,
        vertical: v,
      ),
      child: this,
    );
  }

  Widget paddingLTRB(
    double l,
    double t,
    double r,
    double b,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(l, t, r, b),
      child: this,
    );
  }
}