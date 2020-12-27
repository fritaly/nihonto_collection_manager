import 'package:nihonto_collection_manager/StringExtension.dart';

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
}