import 'package:nihonto_collection_manager/Utils.dart';

class Signature {
  static const Signature EMPTY = Signature();

  /// Should never be null
  final String kanji, romaji;

  const Signature({this.kanji = '', this.romaji = ''});

  Signature copyWith({String kanji, String romaji}) {
    return Signature(kanji: kanji ?? this.kanji, romaji: romaji ?? this.romaji);
  }

  static Signature random() {
    return new Signature(romaji: Utils.randomSignature());
  }

  String toString() {
    return "Signature[kanji: '${kanji}', romaji: '${romaji}']";
  }
}
