import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/labelled.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'period.g.dart';

class Period extends EnumClass with Labelled {

  static Serializer<Period> get serializer => _$periodSerializer;

  static const Period NARA = _$NARA;
  static const Period HEIAN = _$HEIAN;
  static const Period KAMAKURA = _$KAMAKURA;
  static const Period MUROMACHI = _$MUROMACHI;
  static const Period MOMOYAMA = _$MOMOYAMA;
  static const Period EDO = _$EDO;
  static const Period MEIJI = _$MEIJI;
  static const Period TAISHO = _$TAISHO;
  static const Period SHOWA = _$SHOWA;
  static const Period KOTO = _$KOTO;

  /// Term to refer to swords made between the kotō and the shinshintō era, today
  /// mostly defined as from around Keichō (慶長, 1596-1615) to around An ́ei
  ///(安永, 1772-1781).
  static const Period SHINTO = _$SHINTO;

  /// Lit. “new new sword” or “very new sword.” Term to refer to sword made
  /// between the shintō and the haitōrei, which is from around An ́ei (安永,
  /// 1772-1781) to 1876.
  static const Period SHINSHINTO = _$SHINSHINTO;

  /// Lit. “modern sword.” Traditionally, the term gendaitō is applied to swords
  /// made in the traditional way from after the end of the shinshintō era, which
  /// is marked by haitōrei issued in 1876, to the of WWII.
  static const Period GENDAITO = _$GENDAITO;

  /// Lit. “newly made sword.” When sword production resumed in 1953, i.e. after
  /// the ban on sword production issued by the allied forces.
  static const Period SHINSAKUTO = _$SHINSAKUTO;

  const Period._(String name) : super(name);

  static BuiltSet<Period> get values => _$values;
  static Period valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case NARA:
        return 'Nara (710 - 794)';
      case HEIAN:
        return 'Heian (794 - 1185)';
      case KAMAKURA:
        return 'Kamakura (1185 - 1333)';
      case MUROMACHI:
        return 'Muromachi (1336 - 1573)';
      case MOMOYAMA:
        return 'Momoyama (1573 - 1603)';
      case EDO:
        return 'Edo (1600 - 1868)';
      case MEIJI:
        return 'Meiji (1868 - 1912)';
      case TAISHO:
        return 'Taisho (1912 - 1926)';
      case SHOWA:
        return 'Shōwa (1926 - 1989)';
      case KOTO:
        return 'Kotō (1000 - 1596)';
      case SHINTO:
        return 'Shintō (1596 - 1780)';
      case SHINSHINTO:
        return 'Shinshintō (1780 - 1876)';
      case GENDAITO:
        return 'Gendaitō (1876 - 1945)';
      case SHINSAKUTO:
        return 'Shinsakutō (1945 - Now)';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static Period random() => Utils.random(values.toList());
}