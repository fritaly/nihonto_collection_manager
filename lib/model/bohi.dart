import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'bohi.g.dart';

class Bohi extends EnumClass {

  static Serializer<Bohi> get serializer => _$bohiSerializer;

  static const Bohi BO_HI = _$BO_HI;
  static const Bohi SOE_HI = _$SOE_HI;
  static const Bohi HORIMONO = _$HORIMONO;
  static const Bohi KATANA_HI = _$KATANA_HI;
  static const Bohi KOSHI_BI = _$KOSHI_BI;
  static const Bohi FUTASUJI_HI = _$FUTASUJI_HI;
  static const Bohi GOMABASHI = _$GOMABASHI;
  static const Bohi BONJI_KANJI = _$BONJI_KANJI;
  static const Bohi OTHER = _$OTHER;

  const Bohi._(String name) : super(name);

  static BuiltSet<Bohi> get values => _$values;
  static Bohi valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case BO_HI:
        return 'Bo-hi';
      case SOE_HI:
        return 'Soe-hi';
      case HORIMONO:
        return 'Horimono';
      case KATANA_HI:
        return 'Katana-hi';
      case KOSHI_BI:
        return 'Koshi-bi';
      case FUTASUJI_HI:
        return 'Futasuhi-hi';
      case GOMABASHI:
        return 'Gomabashi';
      case BONJI_KANJI:
        return 'Bonji / Kanji';
      case OTHER:
        return 'Other';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static Bohi random() => Utils.random(values.toList());
}