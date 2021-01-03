import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'nihonto_type.g.dart';

class NihontoType extends EnumClass {

  static Serializer<NihontoType> get serializer => _$nihontoTypeSerializer;

  static const NihontoType KATANA = _$KATANA;
  static const NihontoType TACHI = _$TACHI;
  static const NihontoType WAKIZASHI = _$WAKIZASHI;
  static const NihontoType TANTO = _$TANTO;
  static const NihontoType NAGINATA = _$NAGINATA;
  static const NihontoType NAGAMAKI = _$NAGAMAKI;
  static const NihontoType YARI = _$YARI;
  static const NihontoType KEN = _$KEN;
  static const NihontoType OTHER = _$OTHER;

  const NihontoType._(String name) : super(name);

  static BuiltSet<NihontoType> get values => _$values;
  static NihontoType valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case KATANA:
        return 'Katana';
      case TACHI:
        return 'Tachi';
      case WAKIZASHI:
        return 'Wakizashi';
      case TANTO:
        return 'Tanto';
      case NAGINATA:
        return 'Naginata';
      case NAGAMAKI:
        return 'Nagamaki';
      case YARI:
        return 'Yari';
      case KEN:
        return 'Ken';
      case OTHER:
        return 'Other';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static NihontoType random() => Utils.random(values.toList());
}