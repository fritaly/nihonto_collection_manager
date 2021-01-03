import 'package:flutter/foundation.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/model/mune_type.dart';

@immutable
class MuneInfo with Aggregate {
  static const DEFAULT = MuneInfo();

  final MuneType type;

  final String other;

  const MuneInfo({this.type, this.other = ''});

  MuneInfo copyWith({MuneType type, String other}) {
    return MuneInfo(
      type: type ?? this.type,
      other: other ?? this.other,
    );
  }

  static MuneInfo random() {
    return MuneInfo(type: MuneType.random(), other: '');
  }

  @override
  bool isBlank() {
    return (type == null) && (other.isEmpty);
  }

  @override
  String toString() {
    return 'MuneInfo[type: $type, other: ${other}]';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MuneInfo &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          other == other.other;

  @override
  int get hashCode => type.hashCode ^ other.hashCode;
}
