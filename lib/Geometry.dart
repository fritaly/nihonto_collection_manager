import 'package:nihonto_collection_manager/StringExtension.dart';

enum Geometry {
  SHINOGI_ZUKURI,
  SHOBU_ZUKURI,
  HIRA_ZUKURI,
  KATA_KIRI_HA_ZUKURI,
  MOROHA_ZUKURI,
  UNOKUBI_ZUKURI,
  UNKNOWN
}

// See https://stackoverflow.com/questions/29567236/dart-how-to-get-the-value-of-an-enum
extension GeometryExtension on Geometry {

  String name() {
    return this.toString().split('.').last;
  }

  String label() {
    return name().capitalize().replaceAll(new RegExp("_"), " ");
  }
}