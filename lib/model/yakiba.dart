import 'package:nihonto_collection_manager/enum.dart';
import 'package:nihonto_collection_manager/utils.dart';

class Yakiba extends EnumWithLabel<Yakiba> {

  static const NIE = const Yakiba._new('NIE', 'Nie');
  static const NIOI = const Yakiba._new('NIOI', 'Nioi');
  static const INAZUMA = const Yakiba._new('INAZUMA', 'Inazuma');
  static const CHIKEI = const Yakiba._new('CHIKEI', 'Chikei');
  static const TOBIYAKI = const Yakiba._new('TOBIYAKI', 'Tobiyaki');
  static const HOTSURE = const Yakiba._new('HOTSURE', 'Hotsure');
  static const YO = const Yakiba._new('YO', 'Yo');
  static const YAKI_KUZURE = const Yakiba._new('YAKI_KUZURE', 'Yaki kuzure');
  static const YUBASHIRI = const Yakiba._new('YUBASHIRI', 'Yubashiri');
  static const KINSUJI = const Yakiba._new('KINSUJI', 'Kinsuji');
  static const ASHI = const Yakiba._new('ASHI', 'Ashi');
  static const NIJUBA = const Yakiba._new('NIJUBA', 'Nijuba');
  static const UTSURI = const Yakiba._new('UTSURI', 'Utsuri');
  static const OTHER = const Yakiba._new('OTHER', 'Other');

  static const values = [
    NIE,
    NIOI,
    INAZUMA,
    CHIKEI,
    TOBIYAKI,
    HOTSURE,
    YO,
    YAKI_KUZURE,
    ASHI,
    KINSUJI,
    YUBASHIRI,
    NIJUBA,
    UTSURI,
    OTHER
  ];

  const Yakiba._new(String name, String label) : super(name, label);

  static Yakiba valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }

  static Yakiba random() {
    return Utils.random(values);
  }
}
