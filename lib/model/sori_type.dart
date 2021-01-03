import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'sori_type.g.dart';

class SoriType extends EnumClass {

  static Serializer<SoriType> get serializer => _$soriTypeSerializer;

  static const SoriType KOSHIZORI = _$KOSHIZORI;
  static const SoriType TORIIZORI = _$TORIIZORI;
  static const SoriType SAKIZORI = _$SAKIZORI;
  static const SoriType MUZORI = _$MUZORI;
  static const SoriType UCHIZORI = _$UCHIZORI;

  const SoriType._(String name) : super(name);

  static BuiltSet<SoriType> get values => _$values;
  static SoriType valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case KOSHIZORI:
        return 'Koshi-zori';
      case TORIIZORI:
        return 'Torii-zori';
      case SAKIZORI:
        return 'Saki-zori';
      case MUZORI:
        return 'Mu-zori';
      case UCHIZORI:
        return 'Uchi-zori';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static SoriType random() => Utils.random(values.toList());
}