import 'package:flutter/material.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

extension WidgetExtension on Widget {

  Widget pad() {
    return new Container(padding: EdgeInsets.all(8.0), child: this);
  }
}