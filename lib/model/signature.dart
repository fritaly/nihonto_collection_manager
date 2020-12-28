import 'dart:math';

import 'package:nihonto_collection_manager/Utils.dart';

class Signature {

  final String kanji, romaji;

  final bool mumei, gimei, modern;

  const Signature({ this.kanji, this.romaji, this.mumei, this.gimei, this.modern });

  static Signature random() {
    var random = Random();

    return new Signature(romaji: Utils.randomSignature(), mumei: false, gimei: random.nextBool(), modern: random.nextBool());
  }

  String toString() {
    return "Signature[kanji: '${kanji}', romaji: '${romaji}', mumei: ${mumei}, gimei: ${gimei}, modern: ${modern}]";
  }
}