
import 'package:nihonto_collection_manager/enum.dart';
import 'package:nihonto_collection_manager/utils.dart';

class Period extends EnumWithLabel<Period> {

  static const KOTO = const Period._new('KOTO', 'Koto');
  static const SHINTO = const Period._new('SHINTO', 'Shinto');
  static const SHINSHINTO = const Period._new('SHINSHINTO', 'Shinshinto');
  static const GENDAITO = const Period._new('GENDAITO', 'Gendaito');
  static const SHINSAKUTO = const Period._new('SHINSAKUTO', 'Shinsakuto');

  static const values = [
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
