import 'package:flutter/material.dart';

class FieldDecoration extends InputDecoration {

  FieldDecoration(String labelText)
      : super(
            labelText: labelText,
            border: OutlineInputBorder(),
            labelStyle: TextStyle(fontWeight: FontWeight.bold));
}
