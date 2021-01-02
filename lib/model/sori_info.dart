import 'package:flutter/foundation.dart';
import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/model/length.dart';
import 'package:nihonto_collection_manager/model/length_unit.dart';
import 'package:nihonto_collection_manager/model/sori_type.dart';

@immutable
class SoriInfo with Aggregate {

  static const DEFAULT = SoriInfo();

  final SoriType type;

  final Length sori;

  final String other;

  const SoriInfo(
      {this.type,
      this.sori,
      this.other = ''});

  SoriInfo copyWith(
      {SoriType type, Length sori, String other}) {

    return SoriInfo(
        type: type ?? this.type,
        sori: sori ?? this.sori,
        other: other ?? this.other,
    );
  }

  static SoriInfo random() {
    return SoriInfo(type: SoriType.random(), sori: Length.random(LengthUnit.CM, min: 0, max: 3), other: '');
  }

  @override
  bool isBlank() {
    return (type == null) && (sori == null) && (other.isEmpty);
  }

  @override
  String toString() {
    return 'SoriInfo[type: $type, sori: $sori, other: ${other}]';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SoriInfo &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          sori == other.sori &&
          other == other.other;

  @override
  int get hashCode => type.hashCode ^ sori.hashCode ^ other.hashCode;
}
