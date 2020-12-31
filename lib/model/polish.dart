import 'package:nihonto_collection_manager/enum.dart';
import 'package:nihonto_collection_manager/utils.dart';

class Polish extends EnumWithLabel<Polish> {

  static const NONE = const Polish._new('NONE', 'None');
  static const ROUGH = const Polish._new('ROUGH', 'Rough (raw)');
  static const ORIGINAL = const Polish._new('ORIGINAL', 'Original (old)');
  static const HADORI = const Polish._new('HADORI', 'Hadori (modern aka keisho)');
  static const SASHIKOMI = const Polish._new('SASHIKOMI', 'Sashikomi (traditional)');

  static const values = [
    NONE,
    ROUGH,
    ORIGINAL,
    HADORI,
    SASHIKOMI
  ];

  const Polish._new(String name, String label) : super(name, label);

  static Polish valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }

  static Polish random() {
    return Utils.random(Polish.values);
  }
}
