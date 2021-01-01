import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/signature_type.dart';

class SignatureInfo with Aggregate {

  static const DEFAULT = SignatureInfo();

  final EnumSet<SignatureType> types;

  final String other;

  const SignatureInfo({ this.types = const EnumSet.empty(), this.other = '' });

  SignatureInfo copyWith({EnumSet<SignatureType> types, String other}) {
    return SignatureInfo(
      types: types ?? this.types,
      other: other ?? this.other,
    );
  }

  static SignatureInfo random() {
    return SignatureInfo(types: EnumSet.random(SignatureType.values), other: '');
  }

  @override
  bool isBlank() {
    return types.isEmpty() && (other.isEmpty);
  }

  @override
  String toString() {
    return 'SignatureInfo[types: $types, other: $other]';
  }
}