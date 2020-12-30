import 'package:nihonto_collection_manager/enum.dart';

class Polish extends EnumWithLabel<Polish> {

  static const NONE = const Polish._new('NONE', 'None');
  static const ROUGH = const Polish._new('ROUGH', 'Rough / raw');
  static const ORIGINAL = const Polish._new('ORIGINAL', 'Original / old');
  static const MODERN = const Polish._new('MODERN', 'Modern / Keisho');
  static const TRADITIONAL = const Polish._new('TRADITIONAL', 'Traditional / sashikomi');

  static const values = [
    NONE,
    ROUGH,
    ORIGINAL,
    MODERN,
    TRADITIONAL
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
}
