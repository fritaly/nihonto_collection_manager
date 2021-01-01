import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/model/length.dart';
import 'package:nihonto_collection_manager/model/sori_type.dart';

class SoriInfo with Aggregate {

  static const DEFAULT = SoriInfo();

  final SoriType type;

  final Length sori;

  final String other;

  const SoriInfo(
      {this.type,
      this.sori,
      this.other = ''});

  SoriInfo copyWith(
      {SoriType type, Length sori, String other}) {

    return SoriInfo(
        type: type ?? this.type,
        sori: sori ?? this.sori,
        other: other ?? this.other,
    );
  }

  static SoriInfo random() {
    return SoriInfo(type: SoriType.random(), sori: Length.random(min: 0, max: 3), other: '');
  }

  @override
  bool isBlank() {
    return (type == null) && (sori == null) && (other.isEmpty);
  }

  @override
  String toString() {
    return 'SoriInfo[type: $type, sori: $sori, other: ${other}]';
  }
}
