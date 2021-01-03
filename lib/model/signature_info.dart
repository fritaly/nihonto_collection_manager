
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/model/signature_type.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'signature_info.g.dart';

abstract class SignatureInfo with Aggregate implements Built<SignatureInfo, SignatureInfoBuilder> {

  static Serializer<SignatureInfo> get serializer => _$signatureInfoSerializer;

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(SignatureInfoBuilder builder) => builder
    ..kanji = ''
    ..romaji = ''
    ..other = '';

  SignatureInfo._();

  factory SignatureInfo([updates(SignatureInfoBuilder b)]) = _$SignatureInfo;

  String get kanji;

  String get romaji;

  BuiltSet<SignatureType> get types;

  String get other;

  static SignatureInfo random() {
    return SignatureInfo((builder) => builder
      ..types.addAll(Utils.randomIterable(SignatureType.values))
      ..romaji = Utils.randomSignature()
      ..kanji = ''
      ..other = '');
  }

  @override
  bool isBlank() {
    return types.isEmpty && (other.isEmpty) && kanji.isEmpty && romaji.isEmpty;
  }
}
