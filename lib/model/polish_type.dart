import 'package:nihonto_collection_manager/enum.dart';
import 'package:nihonto_collection_manager/utils.dart';

class PolishType extends EnumWithLabel<PolishType> {

  static const NONE = const PolishType._new('NONE', 'None');
  static const ROUGH = const PolishType._new('ROUGH', 'Rough (raw)');
  static const ORIGINAL = const PolishType._new('ORIGINAL', 'Original (old)');
  static const HADORI = const PolishType._new('HADORI', 'Hadori (modern aka keisho)');
  static const SASHIKOMI = const PolishType._new('SASHIKOMI', 'Sashikomi (traditional)');
  static const OTHER = const PolishType._new('OTHER', 'Other');

  static const values = [
    NONE,
    ROUGH,
    ORIGINAL,
    HADORI,
    SASHIKOMI,
    OTHER
  ];

  const PolishType._new(String name, String label) : super(name, label);

  static PolishType valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }

  static PolishType random() {
    return Utils.random(values);
  }
}
