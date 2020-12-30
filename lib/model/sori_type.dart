import 'package:nihonto_collection_manager/enum.dart';
import 'package:nihonto_collection_manager/utils.dart';

class SoriType extends EnumWithLabel<SoriType> {

  static const KOSHIZORI = const SoriType._new('KOSHIZORI', 'Koshi-zori');
  static const TORIIZORI = const SoriType._new('TORIIZORI', 'Torii-zori');
  static const SAKIZORI = const SoriType._new('SAKIZORI', 'Saki-zori');
  static const MUZORI = const SoriType._new('MUZORI', 'Mu-zori');
  static const UCHIZORI = const SoriType._new('UCHIZORI', 'Uchi-zori');

  static const values = [
    KOSHIZORI,
    TORIIZORI,
    SAKIZORI,
    MUZORI,
    UCHIZORI
  ];

  const SoriType._new(String name, String label) : super(name, label);

  static SoriType valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }

  static SoriType random() {
    return Utils.random(values);
  }
}
