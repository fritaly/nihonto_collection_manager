import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/labelled.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'hamon_type.g.dart';

class HamonType extends EnumClass with Labelled {

  static Serializer<HamonType> get serializer => _$hamonTypeSerializer;

  static const HamonType SUGUHA = _$SUGUHA;
  static const HamonType GUNOME = _$GUNOME;
  static const HamonType CHOJI = _$CHOJI;
  static const HamonType MIDARE = _$MIDARE;
  static const HamonType NOTARE = _$NOTARE;
  static const HamonType HITATSURA = _$HITATSURA;
  static const HamonType SUDARE = _$SUDARE;
  static const HamonType TORANBA = _$TORANBA;
  static const HamonType MIMIGATA = _$MIMIGATA;
  static const HamonType KIKUSUI = _$KIKUSUI;
  static const HamonType JUZUBA = _$JUZUBA;
  static const HamonType NOKOGIRIBA = _$NOKOGIRIBA;
  static const HamonType FUJI = _$FUJI;
  static const HamonType DORAN = _$DORAN;
  static const HamonType OTHER = _$OTHER;

  const HamonType._(String name) : super(name);

  static BuiltSet<HamonType> get values => _$values;
  static HamonType valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case SUGUHA:
        return 'Suguha';
      case GUNOME:
        return 'Gunome';
      case CHOJI:
        return 'Choji';
      case MIDARE:
        return 'Midare';
      case NOTARE:
        return 'Notare';
      case HITATSURA:
        return 'Hitatsura';
      case SUDARE:
        return 'Sudare';
      case TORANBA:
        return 'Toranba';
      case MIMIGATA:
        return 'Mimigata';
      case KIKUSUI:
        return 'Kikusui';
      case JUZUBA:
        return 'Juzuba';
      case NOKOGIRIBA:
        return 'Nokogiriba';
      case FUJI:
        return 'Fuji';
      case DORAN:
        return 'Doran';
      case OTHER:
        return 'Other';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static HamonType random() => Utils.random(values.toList());
}