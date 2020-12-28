import 'package:nihonto_collection_manager/Utils.dart';
import 'package:nihonto_collection_manager/model/Geometry.dart';
import 'package:nihonto_collection_manager/model/Money.dart';
import 'package:nihonto_collection_manager/model/NihontoType.dart';

class Nihonto {

  final NihontoType type;

  final String signature;

  final Geometry geometry;

  final Money price;

  const Nihonto(this.type, this.geometry, this.signature, { this.price = Money.ZERO });

  static Nihonto random() {
    return Nihonto(Utils.randomNihontoType(), Utils.randomGeometry(), Utils.randomSignature(), price: Money.random());
  }
}