import 'dart:math';

import 'package:nihonto_collection_manager/model/hada.dart';

class HadaInfo {
  final bool itame, mokume, masame, ayasugi, nashiji, konuka, muji, unknown;

  static const DEFAULT = HadaInfo();

  const HadaInfo(
      {this.itame = false,
      this.mokume = false,
      this.masame = false,
      this.ayasugi = false,
      this.nashiji = false,
      this.konuka = false,
      this.muji = false,
      this.unknown = false });

  HadaInfo copyWith(
      {bool itame,
      bool mokume,
      bool masame,
      bool ayasugi,
      bool nashiji,
      bool konuka,
      bool muji,
      bool unknown}) {
    return HadaInfo(
        itame: itame ?? this.itame,
        mokume: mokume ?? this.mokume,
        masame: masame ?? this.masame,
        ayasugi: ayasugi ?? this.ayasugi,
        nashiji: nashiji ?? this.nashiji,
        konuka: konuka ?? this.konuka,
        muji: muji ?? this.muji,
        unknown: unknown ?? this.unknown);
  }

  static HadaInfo random() {
    final random = Random();

    return HadaInfo(
        ayasugi: random.nextBool(),
        itame: random.nextBool(),
        konuka: random.nextBool(),
        masame: random.nextBool(),
        mokume: random.nextBool(),
        muji: random.nextBool(),
        nashiji: random.nextBool(),
        unknown: random.nextBool());
  }

  bool getValue(Hada hada) {
    assert(hada != null);

    switch (hada) {
      case Hada.ITAME:
        return itame;
      case Hada.MOKUME:
        return mokume;
      case Hada.MASAME:
        return masame;
      case Hada.AYASUGI:
        return ayasugi;
      case Hada.NASHIJI:
        return nashiji;
      case Hada.KONUKA:
        return konuka;
      case Hada.MUJI:
        return muji;
      case Hada.UNKNOWN:
        return unknown;
      default:
        throw Exception("Unsupported hada ${hada}");
    }
  }

  HadaInfo withValue(Hada hada, bool value) {
    assert(hada != null);

    switch (hada) {
      case Hada.ITAME:
        return copyWith(itame: value);
      case Hada.MOKUME:
        return copyWith(mokume: value);
      case Hada.MASAME:
        return copyWith(masame: value);
      case Hada.AYASUGI:
        return copyWith(ayasugi: value);
      case Hada.NASHIJI:
        return copyWith(nashiji: value);
      case Hada.KONUKA:
        return copyWith(konuka: value);
      case Hada.MUJI:
        return copyWith(muji: value);
      case Hada.UNKNOWN:
        return copyWith(unknown: value);
      default:
        throw Exception("Unsupported hada ${hada}");
    }
  }

  static HadaInfo from(Iterable<Hada> types) {
    assert(types != null);

    var result = DEFAULT;

    types.forEach((element) {
      result = result.withValue(element, true);
    });

    return result;
  }

  @override
  String toString() {
    return 'HadaInfo[itame: $itame, mokume: $mokume, masame: $masame, ayasugi: $ayasugi, nashiji: $nashiji, konuka: $konuka, muji: $muji, unknown: ${unknown}]';
  }
}
