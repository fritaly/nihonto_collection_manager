import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/labelled.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'weight_unit.g.dart';

class WeightUnit extends EnumClass with Labelled {

  static Serializer<WeightUnit> get serializer => _$weightUnitSerializer;

  static const WeightUnit GRAM = _$GRAM;

  const WeightUnit._(String name) : super(name);

  static BuiltSet<WeightUnit> get values => _$values;
  static WeightUnit valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case GRAM:
        return 'gram';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  String get symbol {
    switch(this) {
      case GRAM:
        return 'g';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static WeightUnit random() => Utils.random(values.toList());
}