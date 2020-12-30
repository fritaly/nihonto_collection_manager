class Boshi {

  static const OMARU = const Boshi._new('OMARU', 'Omaru');
  static const KOMARU = const Boshi._new('KOMARU', 'Komaru');
  static const TOGARI = const Boshi._new('TOGARI', 'Togari');
  static const MIDARE_KOMI = const Boshi._new('MIDARE_KOMI', 'Midare komi');
  static const YAKIZUME = const Boshi._new('YAKIZUME', 'Yakizume');
  static const JIZO = const Boshi._new('JIZO', 'Jizo');
  static const HAKIKAKE = const Boshi._new('HAKIKAKE', 'Hakikake');
  static const KAEN = const Boshi._new('KAEN', 'Kaen');
  static const KAERI_FUKASHI = const Boshi._new('KAERI_FUKASHI', 'Kaeri fukashi');
  static const KAERI_BUKA = const Boshi._new('KAERI_BUKA', 'Kaeri buka');
  static const KAERI_ASASHI = const Boshi._new('KAERI_ASASHI', 'Kaeri asashi');
  static const KAERI_TSUYOSHI = const Boshi._new('KAERI_TSUYOSHI', 'Kaeri tsuyoshi');
  static const CHOJI_MIDARE_KOMI = const Boshi._new('CHOJI_MIDARE_KOMI', 'Choji midare komi');
  static const NIE_KOZURE = const Boshi._new('NIE_KOZURE', 'Nie kozure');
  static const ICHIMONJI_KAERI = const Boshi._new('ICHIMONJI_KAERI', 'Ichimonji kaeri');
  static const KOMARU_NIERU = const Boshi._new('KOMARU_NIERU', 'Komaru nieru');
  static const NOTARE_KOMI = const Boshi._new('NOTARE_KOMI', 'Notare komi');
  static const ICHI_MAI = const Boshi._new('ICHI_MAI', 'Ichi mai');

  static const values = [
    OMARU,
    KOMARU,
    TOGARI,
    MIDARE_KOMI,
    YAKIZUME,
    JIZO,
    HAKIKAKE,
    KAEN,
    KAERI_ASASHI,
    KAERI_BUKA,
    KAERI_FUKASHI,
    KAERI_TSUYOSHI,
    CHOJI_MIDARE_KOMI,
    NIE_KOZURE,
    ICHIMONJI_KAERI,
    KOMARU_NIERU,
    NOTARE_KOMI,
    ICHI_MAI
  ];

  final String name, label;

  const Boshi._new(this.name, this.label);

  @override
  String toString() {
    return 'Boshi.${name}';
  }

  static Boshi valueOf(String name) {
    assert (name != null);

    var found = values.firstWhere((element) => element.name == name);

    if (found == null) {
      throw Exception("No enum found with name '${name}'");
    }

    return found;
  }
}
