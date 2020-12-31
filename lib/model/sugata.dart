import 'package:nihonto_collection_manager/enum.dart';
import 'package:nihonto_collection_manager/utils.dart';

class Sugata extends EnumWithLabel<Sugata> {

  static const SHINOGI_ZUKURI = const Sugata._new('SHINOGI_ZUKURI', 'Shinogi zukuri');
  static const SHOBU_ZUKURI = const Sugata._new('SHOBU_ZUKURI', 'Shobu zukuri');
  static const HIRA_ZUKURI = const Sugata._new('HIRA_ZUKURI', 'Hira zukuri');
  static const KATA_KIRI_HA_ZUKURI = const Sugata._new('KATA_KIRI_HA_ZUKURI', 'Kata kiri ha zukuri');
  static const KIRI_HA_ZUKURI = const Sugata._new('KIRI_HA_ZUKURI', 'Kiri ha zukuri');
  static const MOROHA_ZUKURI = const Sugata._new('MOROHA_ZUKURI', 'Moroha zukuri');
  static const UNOKUBI_ZUKURI = const Sugata._new('UNOKUBI_ZUKURI', 'Unokubi zukuri');
  static const TSUKURI_KOMI = const Sugata._new('TSUKURI_KOMI', 'Tsukuri komi');
  static const KANMURIOTOSHI_ZUKURI = const Sugata._new('KANMURIOTOSHI_ZUKURI', 'Kanmuriotoshi zukuri');
  static const KOGARASUMARU_ZUKURI = const Sugata._new('KOGARASUMARU_ZUKURI', 'Kogaratsumaru zukuri');
  static const OSORAKU_ZUKURI = const Sugata._new('OSORAKU_ZUKURI', 'Osoraku zukuri');
  static const OTHER = const Sugata._new('OTHER', 'Other');

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
    OSORAKU_ZUKURI,
    OTHER
  ];

  const Sugata._new(String name, String label) : super(name, label);

  static Sugata valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }

  static Sugata random() {
    return Utils.random(values);
  }
}
