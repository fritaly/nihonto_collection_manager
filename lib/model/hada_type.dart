import 'package:nihonto_collection_manager/enum.dart';
import 'package:nihonto_collection_manager/utils.dart';

class HadaType extends EnumWithLabel<HadaType> {

  static const ITAME = const HadaType._new('ITAME', 'Itame');
  static const MOKUME = const HadaType._new('MOKUME', 'Mokume');
  static const MASAME = const HadaType._new('MASAME', 'Masame');
  static const AYASUGI = const HadaType._new('AYASUGI', 'Ayasugi');
  static const NASHIJI = const HadaType._new('NASHIJI', 'Nashiji');
  static const KONUKA = const HadaType._new('KONUKA', 'Konuka');
  static const MUJI = const HadaType._new('MUJI', 'Muji');
  static const OTHER = const HadaType._new('OTHER', 'Other');

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

  const HadaType._new(String name, String label) : super(name, label);

  static HadaType valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }

  static HadaType random() {
    return Utils.random(values);
  }
}
