import 'package:nihonto_collection_manager/enum.dart';
import 'package:nihonto_collection_manager/utils.dart';

class Organization extends EnumWithLabel<Organization> {

  static const NBTHK = const Organization._new('NBTHK', 'NBTHK');
  static const NTHK = const Organization._new('NTHK', 'NTHK');
  static const NTHK_NPO = const Organization._new('NTHK_NPO', 'NTHK-NPO');
  static const OTHER = const Organization._new('OTHER', 'Other');

  static const values = [
    NBTHK,
    NTHK,
    NTHK_NPO,
    OTHER
  ];

  const Organization._new(String name, String label) : super(name, label);

  static Organization valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }

  static Organization random() {
    return Utils.random(values);
  }
}
