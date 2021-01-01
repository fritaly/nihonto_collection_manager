import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/model/length.dart';
import 'package:nihonto_collection_manager/model/sori_type.dart';
import 'package:nihonto_collection_manager/utils.dart';

class SoriInfo with Aggregate {
  final SoriType type;

  final Length sori;

  const SoriInfo(
      {this.type,
      this.sori});

  SoriInfo copyWith(
      {SoriType type, Length sori}) {

    return SoriInfo(
        type: type ?? this.type,
        sori: sori ?? this.sori);
  }

  static SoriInfo random() {
    return SoriInfo(type: SoriType.random(), sori: Length.random(min: 0, max: 3));
  }

  @override
  bool isBlank() {
    return (type == null) && (sori == null);
  }

  @override
  String toString() {
    return 'SoriInfo[type: $type, sori: $sori]';
  }
}
