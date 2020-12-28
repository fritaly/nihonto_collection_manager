import 'package:nihonto_collection_manager/extensions.dart';
import 'package:nihonto_collection_manager/model/sori_type.dart';
import 'package:nihonto_collection_manager/utils.dart';
import 'package:nihonto_collection_manager/model/geometry.dart';
import 'package:nihonto_collection_manager/model/length.dart';
import 'package:nihonto_collection_manager/model/money.dart';
import 'package:nihonto_collection_manager/model/nihonto_type.dart';

class Nihonto {

  final NihontoType type;

  final String signature;

  final Geometry geometry;

  final Money price;

  final Length nagasa, sori;

  final SoriType soriType;

  const Nihonto(this.type, this.geometry, this.signature, { this.price = Money.ZERO, this.nagasa, this.sori, this.soriType });

  static Nihonto random() {
    return Nihonto(
        Utils.randomNihontoType(),
        Utils.randomGeometry(),
        Utils.randomSignature(),
        price: Money.random(),
        nagasa: Length.random(min: 25, max: 75),
        sori: Length.random(min: 0, max: 3),
        soriType: Utils.randomSoriType()
    );
  }

  String toString() {
    return "Nihonto[type: ${type?.name()}, signature: '${signature}', geometry: ${geometry?.name()}, price: ${price}, nagasa: ${nagasa}, sori: ${sori}, soriType: ${soriType?.name()}]";
  }
}