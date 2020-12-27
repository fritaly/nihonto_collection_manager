import 'package:nihonto_collection_manager/Geometry.dart';
import 'package:nihonto_collection_manager/Money.dart';
import 'package:nihonto_collection_manager/NihontoType.dart';

class Nihonto {

  NihontoType type;

  String signature;

  Geometry geometry;

  Money price;

  Nihonto(this.type, this.geometry, this.signature, { this.price = Money.ZERO });
}