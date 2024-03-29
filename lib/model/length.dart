import 'dart:math';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/model/japanese_length.dart';
import 'package:nihonto_collection_manager/model/length_unit.dart';

part 'length.g.dart';

abstract class Length implements Built<Length, LengthBuilder> {

  static Serializer<Length> get serializer => _$lengthSerializer;

  Length._();

  factory Length([updates(LengthBuilder b)]) = _$Length;

  factory Length.of(double value, LengthUnit unit) {
    assert (value >= 0);
    assert (unit != null);

    return Length((builder) => builder
      ..value = value
      ..unit = unit
    );
  }

  double get value;

  LengthUnit get unit;

  Length operator +(Length length) {
    assert (length != null);
    assert (length.unit == this.unit); // Can only add 2 lengths with the same unit

    return Length.of(this.value + length.value, this.unit);
  }

  bool validate() {
    return (value > 0) && (unit != null);
  }

  String toText() {
    // Display the length unit in lower case
    return "${value.toStringAsFixed(2)} ${unit.name.toLowerCase()}";
  }

  Length asCentimeters() {
    switch (unit) {
      case LengthUnit.CM:
        return this;

      case LengthUnit.MM:
        return Length.of(this.value / 10,LengthUnit.CM);

      case LengthUnit.INCH:
        return Length.of(this.value * 2.54,LengthUnit.CM);

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

  static Length random(LengthUnit unit, { double min = 25, double max = 75 }) {
    assert (unit != null);
    assert (min >= 0);
    assert (min < max);

    var span = max - min;

    return Length.of((Random().nextInt((span * 10).toInt()).toDouble() / 10) + min, unit);
  }
}