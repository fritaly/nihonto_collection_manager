
import 'package:nihonto_collection_manager/enum.dart';
import 'package:nihonto_collection_manager/utils.dart';

class Period extends EnumWithLabel<Period> {

  static const NARA = const Period._new('NARA', 'Nara (710 - 794)');
  static const HEIAN = const Period._new('HEIAN', 'Heian (794 - 1185)');
  static const KAMAKURA = const Period._new('KAMAKURA', 'Kamakura (1185 - 1333)');
  static const MUROMACHI = const Period._new('MUROMACHI', 'Muromachi (1336 - 1573)');
  static const MOMOYAMA = const Period._new('MOMOYAMA', 'Momoyama (1573 - 1603)');
  static const EDO = const Period._new('EDO', 'Edo (1600 - 1868)');
  static const MEIJI = const Period._new('MEIJI', 'Meiji (1868 - 1912)');
  static const TAISHO = const Period._new('TAISHO', 'Taisho (1912 - 1926)');
  static const SHOWA = const Period._new('SHOWA', 'Shōwa (1926 - 1989)');

  static const KOTO = const Period._new('KOTO', 'Kotō (1000 - 1596)');

  /// Term to refer to swords made between the kotō and the shinshintō era, today
  /// mostly defined as from around Keichō (慶長, 1596-1615) to around An ́ei
  ///(安永, 1772-1781).
  static const SHINTO = const Period._new('SHINTO', 'Shintō (1596 - 1780)');

  /// Lit. “new new sword” or “very new sword.” Term to refer to sword made
  /// between the shintō and the haitōrei, which is from around An ́ei (安永,
  /// 1772-1781) to 1876.
  static const SHINSHINTO = const Period._new('SHINSHINTO', 'Shinshintō (1780 - 1876)');

  /// Lit. “modern sword.” Traditionally, the term gendaitō is applied to swords
  /// made in the traditional way from after the end of the shinshintō era, which
  /// is marked by haitōrei issued in 1876, to the of WWII.
  static const GENDAITO = const Period._new('GENDAITO', 'Gendaitō (1876 - 1945)');

  /// Lit. “newly made sword.” When sword production resumed in 1953, i.e. after
  /// the ban on sword production issued by the allied forces.
  static const SHINSAKUTO = const Period._new('SHINSAKUTO', 'Shinsakutō (1945 - Now)');

  static const values = [
    NARA,
    HEIAN,
    KAMAKURA,
    MUROMACHI,
    MOMOYAMA,
    EDO,
    MEIJI,
    TAISHO,
    SHOWA,

    KOTO,
    SHINTO,
    SHINSHINTO,
    GENDAITO,
    SHINSAKUTO
  ];

  const Period._new(String name, String label) : super(name, label);

  static Period valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }

  static Period random() {
    return Utils.random(Period.values);
  }
}
