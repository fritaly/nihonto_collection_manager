import 'package:nihonto_collection_manager/Extensions.dart';
import 'package:nihonto_collection_manager/Utils.dart';

enum NihontoType {
  KATANA,
  TACHI,
  WAKIZASHI,
  TANTO,
  NAGINATA,
  NAGAMAKI,
  UNKNOWN
}

// See https://stackoverflow.com/questions/29567236/dart-how-to-get-the-value-of-an-enum
extension NihontoTypeExtension on NihontoType {

  String name() {
    return this.toString().split('.').last;
  }

  String label() {
    return name().capitalize();
  }

  static NihontoType random() {
    return Utils.random(NihontoType.values);
  }
}