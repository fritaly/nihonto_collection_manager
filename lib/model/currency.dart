import 'package:nihonto_collection_manager/enum.dart';
import 'package:nihonto_collection_manager/utils.dart';

class Currency extends Enum<Currency> {

  static const USD = const Currency._new('USD');
  static const EUR = const Currency._new('EUR');
  static const JPY = const Currency._new('JPY');
  static const AUD = const Currency._new('AUD');
  static const GBP = const Currency._new('GBP');

  static const values = [
    USD,
    EUR,
    JPY,
    AUD,
    GBP,
  ];

  const Currency._new(String name) : super(name);

  static Currency valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }

  static Currency random() {
    return Utils.random(values);
  }
}
