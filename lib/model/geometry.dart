import 'package:nihonto_collection_manager/enum.dart';

class Geometry extends EnumWithLabel<Geometry> {

  static const SHINOGI_ZUKURI = const Geometry._new('SHINOGI_ZUKURI', 'Shinogi zukuri');
  static const SHOBU_ZUKURI = const Geometry._new('SHOBU_ZUKURI', 'Shobu zukuri');
  static const HIRA_ZUKURI = const Geometry._new('HIRA_ZUKURI', 'Hira zukuri');
  static const KATA_KIRI_HA_ZUKURI = const Geometry._new('KATA_KIRI_HA_ZUKURI', 'Kata kiri ha zukuri');
  static const KIRI_HA_ZUKURI = const Geometry._new('KIRI_HA_ZUKURI', 'Kiri ha zukuri');
  static const MOROHA_ZUKURI = const Geometry._new('MOROHA_ZUKURI', 'Moroha zukuri');
  static const UNOKUBI_ZUKURI = const Geometry._new('UNOKUBI_ZUKURI', 'Unokubi zukuri');
  static const TSUKURI_KOMI = const Geometry._new('TSUKURI_KOMI', 'Tsukuri komi');
  static const KANMURIOTOSHI_ZUKURI = const Geometry._new('KANMURIOTOSHI_ZUKURI', 'Kanmuriotoshi zukuri');
  static const KOGARASUMARU_ZUKURI = const Geometry._new('KOGARASUMARU_ZUKURI', 'Kogaratsumaru zukuri');
  static const OSORAKU_ZUKURI = const Geometry._new('OSORAKU_ZUKURI', 'Osoraku zukuri');

  static const values = [
    SHINOGI_ZUKURI,
    SHOBU_ZUKURI,
    HIRA_ZUKURI,
    KATA_KIRI_HA_ZUKURI,
    KIRI_HA_ZUKURI,
    MOROHA_ZUKURI,
    UNOKUBI_ZUKURI,
    TSUKURI_KOMI,
    KANMURIOTOSHI_ZUKURI,
    KOGARASUMARU_ZUKURI,
    OSORAKU_ZUKURI
  ];

  const Geometry._new(String name, String label) : super(name, label);

  static Geometry valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }
}
