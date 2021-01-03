import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'signature_type.g.dart';

class SignatureType extends EnumClass {

  static Serializer<SignatureType> get serializer => _$signatureTypeSerializer;

  static const SignatureType MUMEI = _$MUMEI;
  static const SignatureType GIMEI = _$GIMEI;
  static const SignatureType SHOSHIN = _$SHOSHIN;
  static const SignatureType MODERN = _$MODERN;

  const SignatureType._(String name) : super(name);

  static BuiltSet<SignatureType> get values => _$values;
  static SignatureType valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case MUMEI:
        return 'Mumei';
      case GIMEI:
        return 'Gimei';
      case SHOSHIN:
        return 'Shoshin';
      case MODERN:
        return 'Modern';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static SignatureType random() => Utils.random(values.toList());
}