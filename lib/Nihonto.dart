import 'package:nihonto_collection_manager/Geometry.dart';
import 'package:nihonto_collection_manager/Money.dart';
import 'package:nihonto_collection_manager/NihontoType.dart';

class Nihonto {

  final NihontoType type;

  final String signature;

  final Geometry geometry;

  final Money price;

  const Nihonto(this.type, this.geometry, this.signature, { this.price = Money.ZERO });
}