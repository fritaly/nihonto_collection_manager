import 'package:nihonto_collection_manager/enum.dart';
import 'package:nihonto_collection_manager/utils.dart';

class MuneType extends EnumWithLabel<MuneType> {

  static const IORI = const MuneType._new('IORI', 'Iori');
  static const TAKASHI = const MuneType._new('TAKASHI', 'Takashi');
  static const HIKUSHI = const MuneType._new('HIKUSHI', 'Hikushi');
  static const HIRA = const MuneType._new('HIRA', 'Hira');
  static const MITSU = const MuneType._new('MITSU', 'Mitsu');
  static const MARU = const MuneType._new('MARU', 'Maru');
  static const OTHER = const MuneType._new('OTHER', 'Other');

  static const values = [
    IORI,
    TAKASHI,
    HIKUSHI,
    HIRA,
    MITSU,
    MARU,
    OTHER
  ];

  const MuneType._new(String name, String label) : super(name, label);

  static MuneType valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }

  static MuneType random() {
    return Utils.random(values);
  }
}
