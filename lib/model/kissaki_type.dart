import 'package:nihonto_collection_manager/enum.dart';
import 'package:nihonto_collection_manager/utils.dart';

class KissakiType extends EnumWithLabel<KissakiType> {

  static const KO_KISSAKI = const KissakiType._new('KO_KISSAKI', 'Ko kissaki');
  static const CHU_KISSAKI = const KissakiType._new('CHU_KISSAKI', 'Chu kissaki');
  static const O_KISSAKI = const KissakiType._new('O_KISSAKI', 'O kissaki');
  static const IKUBI_KISSAKI = const KissakiType._new('IKUBI_KISSAKI', 'Ikubi kissaki');
  static const IKARI_KISSAKI = const KissakiType._new('IKARI_KISSAKI', 'Ikari kissaki');
  static const KAMASU_KISSAKI = const KissakiType._new('KAMASU_KISSAKI', 'Kamasu kissaki');
  static const MOROHA_KISSAKI = const KissakiType._new('MOROHA_KISSAKI', 'Moroha kissaki');
  static const OTHER = const KissakiType._new('OTHER', 'Other');

  static const values = [
    KO_KISSAKI,
    CHU_KISSAKI,
    O_KISSAKI,
    IKUBI_KISSAKI,
    IKARI_KISSAKI,
    KAMASU_KISSAKI,
    MOROHA_KISSAKI,
    OTHER
  ];

  const KissakiType._new(String name, String label) : super(name, label);

  static KissakiType valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }

  static KissakiType random() {
    return Utils.random(values);
  }
}
