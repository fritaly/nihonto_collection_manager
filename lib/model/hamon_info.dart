import 'package:flutter/foundation.dart';
import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/hamon_type.dart';

@immutable
class HamonInfo with Aggregate {

  static const DEFAULT = HamonInfo();

  final EnumSet<HamonType> types;

  final String other;

  const HamonInfo({ this.types = const EnumSet.empty(), this.other = '' });

  HamonInfo copyWith({EnumSet<HamonType> types, String other}) {
    return HamonInfo(
      types: types ?? this.types,
      other: other ?? this.other,
    );
  }

  static HamonInfo random() {
    return HamonInfo(types: EnumSet.random(HamonType.values), other: '');
  }

  @override
  bool isBlank() {
    return types.isEmpty() && (other.isEmpty);
  }

  @override
  String toString() {
    return 'HamonInfo[types: $types, other: $other]';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HamonInfo &&
          runtimeType == other.runtimeType &&
          types == other.types &&
          other == other.other;

  @override
  int get hashCode => types.hashCode ^ other.hashCode;
}