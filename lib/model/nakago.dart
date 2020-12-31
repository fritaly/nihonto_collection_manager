import 'package:nihonto_collection_manager/enum.dart';

class Nakago extends EnumWithLabel<Nakago> {

  static const UBU = const Nakago._new('UBU', 'Ubu');
  static const FUTSU_GATA = const Nakago._new('FUTSU_GATA', 'Futsu gata');
  static const KIJIMOTO_GATA = const Nakago._new('KIJIMOTO_GATA', 'Kijimoto gata');
  static const SHIRIBARI_GATA = const Nakago._new('SHIRIBARI_GATA', 'Shiribari gata');
  static const GOHEI_GATA = const Nakago._new('GOHEI_GATA', 'Gohei gata');
  static const FUNA_GATA = const Nakago._new('FUNA_GATA', 'Funa gata');
  static const FURISODE_GATA = const Nakago._new('FURISODE_GATA', 'Furisode gata');
  static const SURIAGE = const Nakago._new('SURIAGE', 'Suriage');
  static const O_SURIAGE = const Nakago._new('O_SURIAGE', 'O suriage');
  static const MACHI_OKURI = const Nakago._new('MACHI_OKURI', 'Machi okuri');
  static const OTHER = const Nakago._new('OTHER', 'Other');

  static const values = [
    UBU,
    FUTSU_GATA,
    KIJIMOTO_GATA,
    SHIRIBARI_GATA,
    GOHEI_GATA,
    FUNA_GATA,
    FURISODE_GATA,
    SURIAGE,
    O_SURIAGE,
    MACHI_OKURI,
    OTHER
  ];

  const Nakago._new(String name, String label) : super(name, label);

  static Nakago valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }
}
