import 'package:nihonto_collection_manager/enum.dart';

class LengthUnit extends EnumWithLabel<LengthUnit> {

  static const CM = const LengthUnit._new('CM', 'cm');
  static const MM = const LengthUnit._new('MM', 'mm');
  static const INCH = const LengthUnit._new('INCH', 'inch');

  static const values = [
    CM,
    MM,
    INCH
  ];

  const LengthUnit._new(String name, String label) : super(name, label);

  static LengthUnit valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }
}
