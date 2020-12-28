import 'dart:math';

import 'package:nihonto_collection_manager/extensions.dart';
import 'package:nihonto_collection_manager/model/japanese_length.dart';
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

  static const double ONE_SHAKU = 30.3;
  static const double ONE_SUN = 3.03;
  static const double ONE_BU = 0.303;
  static const double ONE_RIN = 0.0303;

  JapaneseLength asJapaneseLength() {
    var length = asCentimeters().value;

    int shaku = 0, sun = 0, bu = 0, rin = 0;

    if (length >= ONE_SHAKU) {
      shaku = (length ~/ ONE_SHAKU);

      length = (length % ONE_SHAKU);
    }
    if (length >= ONE_SUN) {
      sun = (length ~/ ONE_SUN);

      length = (length % ONE_SUN);
    }
    if (length >= ONE_BU) {
      bu = (length ~/ ONE_BU);

      length = (length % ONE_BU);
    }
    if (length >= ONE_RIN) {
      rin = (length ~/ ONE_RIN);

      length = (length % ONE_RIN);
    }

    return JapaneseLength(shaku, sun, bu, rin);
  }

  static Length random({ double min = 25, double max = 75 }) {
    assert (min >= 0);
    assert (min < max);

    var span = max - min;

    return Length(((Random().nextInt((span * 10).toInt()).toDouble() / 10) + min).toDouble(), LengthUnit.cm);
  }
}