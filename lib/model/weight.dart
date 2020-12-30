import 'dart:math';

import 'package:nihonto_collection_manager/model/weight_unit.dart';

class Weight {

  final double value;
  final WeightUnit unit;

  const Weight(this.value, this.unit);

  Weight operator +(Weight weight) {
    assert (weight != null);
    assert (weight.unit == this.unit); // Can only add 2 weights with the same unit

    return Weight(this.value + weight.value, this.unit);
  }

  bool validate() {
    return (value > 0) && (unit != null);
  }

  String toText() {
    // Display the length unit in lower case
    return "${value.toStringAsFixed(2)} ${unit.name.toLowerCase()}";
  }

  String toString() {
    return toText();
  }

  static Weight random(double min, double max) {
    assert (min >= 0);
    assert (min < max);

    var span = max - min;

    return Weight(((Random().nextInt((span * 10).toInt()).toDouble() / 10) + min).toDouble(), WeightUnit.GRAM);
  }
}