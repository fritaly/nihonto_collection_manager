import 'package:flutter/foundation.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/model/kissaki_type.dart';

@immutable
class KissakiInfo with Aggregate {

  static const DEFAULT = KissakiInfo();

  final KissakiType type;

  final String other;

  const KissakiInfo({this.type, this.other = ''});

  KissakiInfo copyWith({KissakiType type, String other}) {
    return KissakiInfo(
      type: type ?? this.type,
      other: other ?? this.other,
    );
  }

  static KissakiInfo random() {
    return KissakiInfo(type: KissakiType.random(), other: '');
  }

  @override
  bool isBlank() {
    return (type == null) && (other.isEmpty);
  }

  @override
  String toString() {
    return 'KissakiInfo[type: $type, other: ${other}]';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KissakiInfo &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          other == other.other;

  @override
  int get hashCode => type.hashCode ^ other.hashCode;
}
