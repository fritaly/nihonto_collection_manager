import 'package:nihonto_collection_manager/enum.dart';

class Yasurime extends EnumWithLabel<Yasurime> {

  static const KIRI = const Yasurime._new('KIRI', 'Kiri');
  static const KATTESAGARI = const Yasurime._new('KATTESAGARI', 'Kattesagari');
  static const HIGAKI = const Yasurime._new('HIGAKI', 'Higaki');
  static const TAKANOHA = const Yasurime._new('TAKANOHA', 'Taka no ha');
  static const SUJIKAI = const Yasurime._new('SUJIKAI', 'Sujikai');
  static const OTHER = const Yasurime._new('OTHER', 'Other');

  static const values = [
    KIRI,
    KATTESAGARI,
    HIGAKI,
    TAKANOHA,
    SUJIKAI,
    OTHER
  ];

  const Yasurime._new(String name, String label) : super(name, label);

  static Yasurime valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }
}
