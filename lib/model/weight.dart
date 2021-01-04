import 'dart:math';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/model/weight_unit.dart';

part 'weight.g.dart';

abstract class Weight implements Built<Weight, WeightBuilder> {

  static Serializer<Weight> get serializer => _$weightSerializer;

  Weight._();

  factory Weight([updates(WeightBuilder b)]) = _$Weight;

  factory Weight.of(double value, WeightUnit unit) {
    assert (value >= 0);
    assert (unit != null);

    return Weight((builder) => builder
      ..value = value
      ..unit = unit
    );
  }

  double get value;

  WeightUnit get unit;

  Weight operator +(Weight weight) {
    assert (weight != null);
    assert (weight.unit == this.unit); // Can only add 2 weights with the same unit

    return Weight.of(this.value + weight.value, this.unit);
  }

  bool validate() {
    return (value > 0) && (unit != null);
  }

  String toText() {
    return "${value.toStringAsFixed(2)} ${unit.symbol}";
  }

  static Weight random(double min, double max) {
    assert (min >= 0);
    assert (min < max);

    var span = max - min;

    return Weight.of(((Random().nextInt((span * 10).toInt()).toDouble() / 10) + min).toDouble(), WeightUnit.GRAM);
  }
}


