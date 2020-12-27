import 'package:flutter/material.dart';

extension WidgetExtension on Widget {

  Widget pad() {
    return new Container(padding: EdgeInsets.all(8.0), child: this);
  }
}