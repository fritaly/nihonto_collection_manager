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
}