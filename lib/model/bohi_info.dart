import 'package:flutter/foundation.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/bohi.dart';

@immutable
class BohiInfo with Aggregate {

  static const DEFAULT = BohiInfo();

  final EnumSet<Bohi> types;

  final String other;

  const BohiInfo({ this.types = const EnumSet.empty(), this.other = '' });

  BohiInfo copyWith({EnumSet<Bohi> types, String other}) {
    return BohiInfo(
      types: types ?? this.types,
      other: other ?? this.other,
    );
  }

  static BohiInfo random() {
    return BohiInfo(types: EnumSet.random(Bohi.values), other: '');
  }

  @override
  bool isBlank() {
    return types.isEmpty() && (other.isEmpty);
  }

  @override
  String toString() {
    return 'BohiInfo[types: $types, other: $other]';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BohiInfo &&
          runtimeType == other.runtimeType &&
          types == other.types &&
          other == other.other;

  @override
  int get hashCode => types.hashCode ^ other.hashCode;
}
