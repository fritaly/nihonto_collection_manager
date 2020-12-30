import 'package:nihonto_collection_manager/enum.dart';

class WeightUnit extends EnumWithLabel<WeightUnit> {

  static const GRAM = const WeightUnit._new('GRAM', 'gram', 'g');

  static const values = [
    GRAM
  ];

  final String symbol;

  const WeightUnit._new(String name, String label, this.symbol) : super(name, label);

  static WeightUnit valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }
}
