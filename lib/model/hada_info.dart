import 'dart:math';

import 'package:nihonto_collection_manager/model/hada.dart';

class HadaInfo {
  final bool itame, mokume, masame, ayasugi, nashiji, konuka, muji;

  static const DEFAULT = HadaInfo();

  const HadaInfo(
      {this.itame = false,
      this.mokume = false,
      this.masame = false,
      this.ayasugi = false,
      this.nashiji = false,
      this.konuka = false,
      this.muji = false});

  HadaInfo copyWith(
      {bool itame,
      bool mokume,
      bool masame,
      bool ayasugi,
      bool nashiji,
      bool konuka,
      bool muji}) {
    return HadaInfo(
        itame: itame ?? this.itame,
        mokume: mokume ?? this.mokume,
        masame: masame ?? this.masame,
        ayasugi: ayasugi ?? this.ayasugi,
        nashiji: nashiji ?? this.nashiji,
        konuka: konuka ?? this.konuka,
        muji: muji ?? this.muji);
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
        nashiji: random.nextBool());
  }

  bool getValue(Hada hada) {
    assert (hada != null);

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
      default:
        throw Exception("Unsupported hada ${hada}");
    }
  }

  @override
  String toString() {
    return 'HadaInfo[itame: $itame, mokume: $mokume, masame: $masame, ayasugi: $ayasugi, nashiji: $nashiji, konuka: $konuka, muji: $muji]';
  }
}
