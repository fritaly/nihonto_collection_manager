import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/labelled.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'boshi.g.dart';

class Boshi extends EnumClass with Labelled {

  static Serializer<Boshi> get serializer => _$boshiSerializer;

  static const Boshi OMARU = _$OMARU;
  static const Boshi KOMARU = _$KOMARU;
  static const Boshi TOGARI = _$TOGARI;
  static const Boshi MIDARE_KOMI = _$MIDARE_KOMI;
  static const Boshi YAKIZUME = _$YAKIZUME;
  static const Boshi JIZO = _$JIZO;
  static const Boshi HAKIKAKE = _$HAKIKAKE;
  static const Boshi KAEN = _$KAEN;
  static const Boshi KAERI_FUKASHI = _$KAERI_FUKASHI;
  static const Boshi KAERI_BUKA = _$KAERI_BUKA;
  static const Boshi KAERI_ASASHI = _$KAERI_ASASHI;
  static const Boshi KAERI_TSUYOSHI = _$KAERI_TSUYOSHI;
  static const Boshi CHOJI_MIDARE_KOMI = _$CHOJI_MIDARE_KOMI;
  static const Boshi NIE_KOZURE = _$NIE_KOZURE;
  static const Boshi ICHIMONJI_KAERI = _$ICHIMONJI_KAERI;
  static const Boshi KOMARU_NIERU = _$KOMARU_NIERU;
  static const Boshi NOTARE_KOMI = _$NOTARE_KOMI;
  static const Boshi ICHI_MAI = _$ICHI_MAI;
  static const Boshi OTHER = _$OTHER;

  const Boshi._(String name) : super(name);

  static BuiltSet<Boshi> get values => _$values;
  static Boshi valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case OMARU:
        return 'Omaru';
      case KOMARU:
        return 'Komaru';
      case TOGARI:
        return 'Togari';
      case MIDARE_KOMI:
        return 'Midare komi';
      case YAKIZUME:
        return 'Yakizume';
      case JIZO:
        return 'Jizo';
      case HAKIKAKE:
        return 'Hakikake';
      case KAEN:
        return 'Kaen';
      case KAERI_FUKASHI:
        return 'Kaeri fukashi';
      case KAERI_BUKA:
        return 'Kaeri buka';
      case KAERI_ASASHI:
        return 'Kaeri asashi';
      case KAERI_TSUYOSHI:
        return 'Kaeri tsuyoshi';
      case CHOJI_MIDARE_KOMI:
        return 'Choji midare komi';
      case NIE_KOZURE:
        return 'Nie kozure';
      case ICHIMONJI_KAERI:
        return 'Ichimonji kaeri';
      case KOMARU_NIERU:
        return 'Komaru nieru';
      case NOTARE_KOMI:
        return 'Notare komi';
      case ICHI_MAI:
        return 'Ichi mai';
      case OTHER:
        return 'Other';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static Boshi random() => Utils.random(values.toList());
}