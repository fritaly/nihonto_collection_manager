import 'package:flutter/foundation.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/yasurime.dart';

@immutable
class YasurimeInfo with Aggregate {

  static const DEFAULT = YasurimeInfo();

  final EnumSet<Yasurime> types;

  final String other;

  const YasurimeInfo({ this.types = const EnumSet.empty(), this.other = '' });

  YasurimeInfo copyWith({EnumSet<Yasurime> types, String other}) {
    return YasurimeInfo(
      types: types ?? this.types,
      other: other ?? this.other,
    );
  }

  static YasurimeInfo random() {
    return YasurimeInfo(types: EnumSet.random(Yasurime.values), other: '');
  }

  @override
  bool isBlank() {
    return types.isEmpty() && (other.isEmpty);
  }

  @override
  String toString() {
    return 'YasurimeInfo[types: $types, other: $other]';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YasurimeInfo &&
          runtimeType == other.runtimeType &&
          types == other.types &&
          other == other.other;

  @override
  int get hashCode => types.hashCode ^ other.hashCode;
}