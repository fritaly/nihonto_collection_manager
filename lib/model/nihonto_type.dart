import 'package:nihonto_collection_manager/enum.dart';
import 'package:nihonto_collection_manager/utils.dart';

class NihontoType extends EnumWithLabel<NihontoType> {

  static const KATANA = const NihontoType._new('KATANA', 'Katana');
  static const TACHI = const NihontoType._new('TACHI', 'Tachi');
  static const WAKIZASHI = const NihontoType._new('WAKIZASHI', 'Wakizashi');
  static const TANTO = const NihontoType._new('TANTO', 'Tanto');
  static const NAGINATA = const NihontoType._new('NAGINATA', 'Naginata');
  static const NAGAMAKI = const NihontoType._new('NAGAMAKI', 'Nagamaki');
  static const YARI = const NihontoType._new('YARI', 'Yari');
  static const KEN = const NihontoType._new('KEN', 'Ken');
  static const OTHER = const NihontoType._new('OTHER', 'Other');

  static const values = [
    KATANA,
    TACHI,
    WAKIZASHI,
    TANTO,
    NAGINATA,
    NAGAMAKI,
    YARI,
    KEN,
    OTHER
  ];

  const NihontoType._new(String name, String label) : super(name, label);

  static NihontoType valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }

  static NihontoType random() {
    return Utils.random(values);
  }
}
