import 'package:nihonto_collection_manager/enum.dart';

class SignatureType extends EnumWithLabel<SignatureType> {

  static const MUMEI = const SignatureType._new('MUMEI', 'Mumei');
  static const GIMEI = const SignatureType._new('GIMEI', 'Gimei');
  static const SHOSHIN = const SignatureType._new('SHOSHIN', 'Shoshin');
  static const MODERN = const SignatureType._new('MODERN', 'Modern');

  static const values = [
    MUMEI,
    GIMEI,
    SHOSHIN,
    MODERN
  ];

  const SignatureType._new(String name, String label) : super(name, label);

  static SignatureType valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }
}
