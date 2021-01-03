import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'yakiba.g.dart';

class Yakiba extends EnumClass {

  static Serializer<Yakiba> get serializer => _$yakibaSerializer;

  static const Yakiba NIE = _$NIE;
  static const Yakiba NIOI = _$NIOI;
  static const Yakiba INAZUMA = _$INAZUMA;
  static const Yakiba CHIKEI = _$CHIKEI;
  static const Yakiba TOBIYAKI = _$TOBIYAKI;
  static const Yakiba HOTSURE = _$HOTSURE;
  static const Yakiba YO = _$YO;
  static const Yakiba YAKI_KUZURE = _$YAKI_KUZURE;
  static const Yakiba YUBASHIRI = _$YUBASHIRI;
  static const Yakiba KINSUJI = _$KINSUJI;
  static const Yakiba ASHI = _$ASHI;
  static const Yakiba NIJUBA = _$NIJUBA;
  static const Yakiba UTSURI = _$UTSURI;
  static const Yakiba OTHER = _$OTHER;

  const Yakiba._(String name) : super(name);

  static BuiltSet<Yakiba> get values => _$values;
  static Yakiba valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case NIE:
        return 'Nie';
      case NIOI:
        return 'Nioi';
      case INAZUMA:
        return 'Inazuma';
      case CHIKEI:
        return 'Chikei';
      case TOBIYAKI:
        return 'Tobiyaki';
      case HOTSURE:
        return 'Hotsure';
      case YO:
        return 'Yo';
      case YAKI_KUZURE:
        return 'Yaki kuzure';
      case YUBASHIRI:
        return 'Yubashiri';
      case KINSUJI:
        return 'Kinsuji';
      case ASHI:
        return 'Ashi';
      case NIJUBA:
        return 'Nijuba';
      case UTSURI:
        return 'Utsuri';
      case OTHER:
        return 'Other';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static Yakiba random() => Utils.random(values.toList());
}