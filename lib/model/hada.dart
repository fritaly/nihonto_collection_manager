import 'package:nihonto_collection_manager/enum.dart';

class Hada extends EnumWithLabel<Hada> {

  static const ITAME = const Hada._new('ITAME', 'Itame');
  static const MOKUME = const Hada._new('MOKUME', 'Mokume');
  static const MASAME = const Hada._new('MASAME', 'Masame');
  static const AYASUGI = const Hada._new('AYASUGI', 'Ayasugi');
  static const NASHIJI = const Hada._new('NASHIJI', 'Nashiji');
  static const KONUKA = const Hada._new('KONUKA', 'Konuka');
  static const MUJI = const Hada._new('MUJI', 'Muji');
  static const OTHER = const Hada._new('OTHER', 'Other');

  static const values = [
    ITAME,
    MOKUME,
    MASAME,
    AYASUGI,
    NASHIJI,
    KONUKA,
    MUJI,
    OTHER
  ];

  const Hada._new(String name, String label) : super(name, label);

  static Hada valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }
}
