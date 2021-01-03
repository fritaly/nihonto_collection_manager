import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/labelled.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'nakago.g.dart';

class Nakago extends EnumClass with Labelled {

  static Serializer<Nakago> get serializer => _$nakagoSerializer;

  static const Nakago UBU = _$UBU;
  static const Nakago FUTSU_GATA = _$FUTSU_GATA;
  static const Nakago KIJIMOTO_GATA = _$KIJIMOTO_GATA;
  static const Nakago SHIRIBARI_GATA = _$SHIRIBARI_GATA;
  static const Nakago GOHEI_GATA = _$GOHEI_GATA;
  static const Nakago FUNA_GATA = _$FUNA_GATA;
  static const Nakago FURISODE_GATA = _$FURISODE_GATA;
  static const Nakago SURIAGE = _$SURIAGE;
  static const Nakago O_SURIAGE = _$O_SURIAGE;
  static const Nakago MACHI_OKURI = _$MACHI_OKURI;
  static const Nakago OTHER = _$OTHER;

  const Nakago._(String name) : super(name);

  static BuiltSet<Nakago> get values => _$values;
  static Nakago valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case UBU:
        return 'Ubu';
      case FUTSU_GATA:
        return 'Futsu gata';
      case KIJIMOTO_GATA:
        return 'Kijimoto gata';
      case SHIRIBARI_GATA:
        return 'Shiribari gata';
      case GOHEI_GATA:
        return 'Gohei gata';
      case FUNA_GATA:
        return 'Funa gata';
      case FURISODE_GATA:
        return 'Furisode gata';
      case SURIAGE:
        return 'Suriage';
      case O_SURIAGE:
        return 'O suriage';
      case MACHI_OKURI:
        return 'Machi okuri';
      case OTHER:
        return 'Other';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static Nakago random() => Utils.random(values.toList());
}