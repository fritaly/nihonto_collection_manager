import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'hada_type.g.dart';

class HadaType extends EnumClass {

  static Serializer<HadaType> get serializer => _$hadaTypeSerializer;

  static const HadaType ITAME = _$ITAME;
  static const HadaType MOKUME = _$MOKUME;
  static const HadaType MASAME = _$MASAME;
  static const HadaType AYASUGI = _$AYASUGI;
  static const HadaType NASHIJI = _$NASHIJI;
  static const HadaType KONUKA = _$KONUKA;
  static const HadaType MUJI = _$MUJI;
  static const HadaType OTHER = _$OTHER;

  const HadaType._(String name) : super(name);

  static BuiltSet<HadaType> get values => _$values;
  static HadaType valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case ITAME:
        return 'Itame';
      case MOKUME:
        return 'Mokume';
      case MASAME:
        return 'Masame';
      case AYASUGI:
        return 'Ayasugi';
      case NASHIJI:
        return 'Nashiji';
      case KONUKA:
        return 'Konuka';
      case MUJI:
        return 'Muji';
      case OTHER:
        return 'Other';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static HadaType random() => Utils.random(values.toList());
}