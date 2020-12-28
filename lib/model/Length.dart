import 'dart:math';

import 'package:nihonto_collection_manager/Extensions.dart';
import 'package:nihonto_collection_manager/model/LengthUnit.dart';

class Length {

  final double value;
  final LengthUnit unit;

  const Length(this.value, this.unit);

  String toText() {
    return "${value} ${unit.name()}";
  }

  String toString() {
    return toText();
  }

  static Length random() {
    return Length((Random().nextInt(50) + 25).toDouble(), LengthUnit.cm);
  }
}