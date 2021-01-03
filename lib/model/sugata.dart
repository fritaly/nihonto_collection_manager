import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/labelled.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'sugata.g.dart';

class Sugata extends EnumClass with Labelled {

  static Serializer<Sugata> get serializer => _$sugataSerializer;

  static const Sugata SHINOGI_ZUKURI = _$SHINOGI_ZUKURI;
  static const Sugata SHOBU_ZUKURI = _$SHOBU_ZUKURI;
  static const Sugata HIRA_ZUKURI = _$HIRA_ZUKURI;
  static const Sugata KATA_KIRI_HA_ZUKURI = _$KATA_KIRI_HA_ZUKURI;
  static const Sugata KIRI_HA_ZUKURI = _$KIRI_HA_ZUKURI;
  static const Sugata MOROHA_ZUKURI = _$MOROHA_ZUKURI;
  static const Sugata UNOKUBI_ZUKURI = _$UNOKUBI_ZUKURI;
  static const Sugata TSUKURI_KOMI = _$TSUKURI_KOMI;
  static const Sugata KANMURIOTOSHI_ZUKURI = _$KANMURIOTOSHI_ZUKURI;
  static const Sugata KOGARASUMARU_ZUKURI = _$KOGARASUMARU_ZUKURI;
  static const Sugata OSORAKU_ZUKURI = _$OSORAKU_ZUKURI;
  static const Sugata OTHER = _$OTHER;

  const Sugata._(String name) : super(name);

  static BuiltSet<Sugata> get values => _$values;
  static Sugata valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case SHINOGI_ZUKURI:
        return 'Shinogi zukuri';
      case SHOBU_ZUKURI:
        return 'Shobu zukuri';
      case HIRA_ZUKURI:
        return 'Hira zukuri';
      case KATA_KIRI_HA_ZUKURI:
        return 'Kata kiri ha zukuri';
      case KIRI_HA_ZUKURI:
        return 'Kiri ha zukuri';
      case MOROHA_ZUKURI:
        return 'Moroha zukuri';
      case UNOKUBI_ZUKURI:
        return 'Unokubi zukuri';
      case TSUKURI_KOMI:
        return 'Tsukuri komi';
      case KANMURIOTOSHI_ZUKURI:
        return 'Kanmuriotoshi zukuri';
      case KOGARASUMARU_ZUKURI:
        return 'Kogaratsumaru zukuri';
      case OSORAKU_ZUKURI:
        return 'Osoraku zukuri';
      case OTHER:
        return 'Other';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static Sugata random() => Utils.random(values.toList());
}