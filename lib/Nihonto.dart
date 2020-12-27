import 'package:nihonto_collection_manager/Geometry.dart';
import 'package:nihonto_collection_manager/NihontoType.dart';

class Nihonto {

  NihontoType type;

  String signature;

  Geometry geometry;

  Nihonto(NihontoType this.type, Geometry this.geometry, String this.signature);
}