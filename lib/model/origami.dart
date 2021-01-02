import 'package:nihonto_collection_manager/model/organization.dart';

class Origami {

  final Organization issuer;

  final String type;

  final DateTime issuedAt;

  Origami({Organization this.issuer, String this.type, DateTime this.issuedAt});

  @override
  String toString() {
    return 'Origami[issuer: $issuer, type: $type, issuedAt: ${issuedAt}]';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Origami &&
          runtimeType == other.runtimeType &&
          issuer == other.issuer &&
          type == other.type &&
          issuedAt == other.issuedAt;

  @override
  int get hashCode => issuer.hashCode ^ type.hashCode ^ issuedAt.hashCode;
}