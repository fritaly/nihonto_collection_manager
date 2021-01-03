import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/labelled.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'length_unit.g.dart';

class LengthUnit extends EnumClass with Labelled {

  static Serializer<LengthUnit> get serializer => _$lengthUnitSerializer;

  static const LengthUnit CM = _$CM;
  static const LengthUnit MM = _$MM;
  static const LengthUnit INCH = _$INCH;

  const LengthUnit._(String name) : super(name);

  static BuiltSet<LengthUnit> get values => _$values;
  static LengthUnit valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case CM:
        return 'cm';
      case MM:
        return 'mm';
      case INCH:
        return 'inch';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static LengthUnit random() => Utils.random(values.toList());
}