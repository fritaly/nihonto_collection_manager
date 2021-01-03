import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/labelled.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'polish_type.g.dart';

class PolishType extends EnumClass with Labelled {

  static Serializer<PolishType> get serializer => _$polishTypeSerializer;

  static const PolishType NONE = _$NONE;
  static const PolishType ROUGH = _$ROUGH;
  static const PolishType ORIGINAL = _$ORIGINAL;
  static const PolishType HADORI = _$HADORI;
  static const PolishType SASHIKOMI = _$SASHIKOMI;
  static const PolishType OTHER = _$OTHER;

  const PolishType._(String name) : super(name);

  static BuiltSet<PolishType> get values => _$values;
  static PolishType valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case NONE:
        return 'None';
      case ROUGH:
        return 'Rough (raw)';
      case ORIGINAL:
        return 'Original (old)';
      case HADORI:
        return 'Hadori (modern aka keisho)';
      case SASHIKOMI:
        return 'Sashikomi (traditional)';
      case OTHER:
        return 'Other';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static PolishType random() => Utils.random(values.toList());
}