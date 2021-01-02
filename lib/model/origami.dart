import 'package:flutter/foundation.dart';
import 'package:nihonto_collection_manager/model/organization.dart';

@immutable
class Origami {

  static const DEFAULT = Origami();

  final Organization issuer;

  final String type;

  final DateTime issuedAt;

  final String other;

  const Origami({this.issuer, this.type = '', this.issuedAt, this.other = ''});

  @override
  String toString() {
    return 'Origami[issuer: $issuer, type: $type, issuedAt: ${issuedAt}, other: ${other}]';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Origami &&
          runtimeType == other.runtimeType &&
          issuer == other.issuer &&
          type == other.type &&
          issuedAt == other.issuedAt &&
          this.other == other.other;

  @override
  int get hashCode => issuer.hashCode ^ type.hashCode ^ issuedAt.hashCode ^ other.hashCode;

  Origami copyWith({
    Organization issuer,
    String type,
    DateTime issuedAt,
    String other,
  }) {
    if ((issuer == null || identical(issuer, this.issuer)) &&
        (type == null || identical(type, this.type)) &&
        (issuedAt == null || identical(issuedAt, this.issuedAt)) &&
        (other == null || identical(other, this.other))) {
      return this;
    }

    return new Origami(
      issuer: issuer ?? this.issuer,
      type: type ?? this.type,
      issuedAt: issuedAt ?? this.issuedAt,
      other: other ?? this.other,
    );
  }
}