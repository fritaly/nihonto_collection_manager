import 'package:nihonto_collection_manager/enum.dart';

class HamonType extends EnumWithLabel<HamonType> {

  static const SUGUHA = const HamonType._new('SUGUHA', 'Suguha');
  static const GUNOME = const HamonType._new('GUNOME', 'Gunome');
  static const CHOJI = const HamonType._new('CHOJI', 'Choji');
  static const MIDARE = const HamonType._new('MIDARE', 'Midare');
  static const NOTARE = const HamonType._new('NOTARE', 'Notare');
  static const HITATSURA = const HamonType._new('HITATSURA', 'Hitatsura');
  static const SUDARE = const HamonType._new('SUDARE', 'Sudare');
  static const TORANBA = const HamonType._new('TORANBA', 'Toranba');
  static const JUZUBA = const HamonType._new('JUZUBA', 'Juzuba');
  static const KIKUSUI = const HamonType._new('KIKUSUI', 'Kikusui');
  static const MIMIGATA = const HamonType._new('MIMIGATA', 'Mimigata');
  static const NOKOGIRIBA = const HamonType._new('NOKOGIRIBA', 'Nokogiriba');
  static const FUJI = const HamonType._new('FUJI', 'Fuji');
  static const DORAN = const HamonType._new('DORAN', 'Doran');
  static const OTHER = const HamonType._new('OTHER', 'Other');

  static const values = [
    SUGUHA,
    GUNOME,
    CHOJI,
    MIDARE,
    NOTARE,
    HITATSURA,
    SUDARE,
    TORANBA,
    MIMIGATA,
    KIKUSUI,
    JUZUBA,
    NOKOGIRIBA,
    FUJI,
    DORAN,
    OTHER
  ];

  const HamonType._new(String name, String label) : super(name, label);

  static HamonType valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }
}
