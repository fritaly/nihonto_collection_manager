import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/hada_type.dart';

class HadaInfo with Aggregate {

  static const DEFAULT = HadaInfo();

  final EnumSet<HadaType> types;

  final String other;

  const HadaInfo({ this.types = const EnumSet.empty(), this.other = '' });

  HadaInfo copyWith({EnumSet<HadaType> types, String other}) {
    return HadaInfo(
      types: types ?? this.types,
      other: other ?? this.other,
    );
  }

  static HadaInfo random() {
    return HadaInfo(types: EnumSet.random(HadaType.values), other: '');
  }

  @override
  bool isBlank() {
    return types.isEmpty() && (other.isEmpty);
  }

  @override
  String toString() {
    return 'HadaInfo[types: $types, other: $other]';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HadaInfo &&
          runtimeType == other.runtimeType &&
          types == other.types &&
          other == other.other;

  @override
  int get hashCode => types.hashCode ^ other.hashCode;
}