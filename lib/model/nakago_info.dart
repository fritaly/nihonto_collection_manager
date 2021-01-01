import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/nakago.dart';

class NakagoInfo with Aggregate {

  static const DEFAULT = NakagoInfo();

  final EnumSet<Nakago> types;

  final String other;

  const NakagoInfo({ this.types = const EnumSet.empty(), this.other = '' });

  NakagoInfo copyWith({EnumSet<Nakago> types, String other}) {
    return NakagoInfo(
      types: types ?? this.types,
      other: other ?? this.other,
    );
  }

  static NakagoInfo random() {
    return NakagoInfo(types: EnumSet.random(Nakago.values), other: '');
  }

  @override
  bool isBlank() {
    return types.isEmpty() && (other.isEmpty);
  }

  @override
  String toString() {
    return 'NakagoInfo[types: $types, other: $other]';
  }
}