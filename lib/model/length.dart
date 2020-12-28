import 'dart:math';

import 'package:nihonto_collection_manager/extensions.dart';
import 'package:nihonto_collection_manager/model/length_unit.dart';

class Length {

  final double value;
  final LengthUnit unit;

  const Length(this.value, this.unit);

  bool validate() {
    return (value > 0) && (unit != null);
  }

  String toText() {
    return "${value} ${unit.name()}";
  }

  String toString() {
    return toText();
  }

  Length asCentimeters() {
    switch (unit) {
      case LengthUnit.cm:
        return this;
      case LengthUnit.mm:
        return Length(value / 10, LengthUnit.cm);
      case LengthUnit.inch:
        return Length(value * 2.54, LengthUnit.cm);
      default:
        throw Exception("Unsupported length unit: ${unit}");
    }
  }

  static Length random({ double min = 25, double max = 75 }) {
    assert (min >= 0);
    assert (min < max);

    var span = max - min;

    return Length(((Random().nextInt((span * 10).toInt()).toDouble() / 10) + min).toDouble(), LengthUnit.cm);
  }
}