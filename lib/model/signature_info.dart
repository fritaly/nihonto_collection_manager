import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/signature_type.dart';
import 'package:nihonto_collection_manager/utils.dart';

class SignatureInfo with Aggregate {

  static const DEFAULT = SignatureInfo();

  final String kanji, romaji;

  final EnumSet<SignatureType> types;

  final String other;

  const SignatureInfo({ this.kanji = '', this.romaji = '', this.types = const EnumSet.empty(), this.other = '' });

  SignatureInfo copyWith({ String kanji, String romaji, EnumSet<SignatureType> types, String other}) {
    return SignatureInfo(
      kanji: kanji ?? this.kanji,
      romaji: romaji ?? this.romaji,
      types: types ?? this.types,
      other: other ?? this.other,
    );
  }

  static SignatureInfo random() {
    return SignatureInfo(romaji: Utils.randomSignature(), types: EnumSet.random(SignatureType.values), other: '');
  }

  @override
  bool isBlank() {
    return types.isEmpty() && (other.isEmpty) && kanji.isEmpty && romaji.isEmpty;
  }

  @override
  String toString() {
    return "SignatureInfo[kanji: '$kanji', romaji: '$romaji', types: $types, other: '$other']";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignatureInfo &&
          runtimeType == other.runtimeType &&
          kanji == other.kanji &&
          romaji == other.romaji &&
          types == other.types &&
          other == other.other;

  @override
  int get hashCode =>
      kanji.hashCode ^ romaji.hashCode ^ types.hashCode ^ other.hashCode;
}