import 'package:nihonto_collection_manager/enum.dart';

class Bohi extends EnumWithLabel<Bohi> {

  static const BO_HI = const Bohi._new('BO_HI', 'Bo-hi');
  static const SOE_HI = const Bohi._new('SOE_HI', 'Soe-hi');
  static const HORIMONO = const Bohi._new('HORIMONO', 'Horimono');
  static const KATANA_HI = const Bohi._new('KATANA_HI', 'Katana hi');
  static const KOSHI_BI = const Bohi._new('KOSHI_BI', 'Koshi bi');
  static const FUTASUJI_HI = const Bohi._new('FUTASUJI_HI', 'Futasuhi-hi');
  static const GOMABASHI = const Bohi._new('GOMABASHI', 'Gomabashi');
  static const BONJI_KANJI = const Bohi._new('BONJI_KANJI', 'Bonji / Kanji');

  static const values = [
    BO_HI,
    SOE_HI,
    HORIMONO,
    KATANA_HI,
    KOSHI_BI,
    FUTASUJI_HI,
    GOMABASHI,
    BONJI_KANJI
  ];

  const Bohi._new(String name, String label) : super(name, label);

  static Bohi valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }
}