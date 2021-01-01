import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/boshi.dart';

class BoshiInfo with Aggregate {

  static const DEFAULT = BoshiInfo();

  final EnumSet<Boshi> types;

  final String other;

  const BoshiInfo({ this.types = const EnumSet.empty(), this.other = '' });

  BoshiInfo copyWith({EnumSet<Boshi> types, String other}) {
    return BoshiInfo(
      types: types ?? this.types,
      other: other ?? this.other,
    );
  }

  static BoshiInfo random() {
    return BoshiInfo(types: EnumSet.random(Boshi.values), other: '');
  }

  @override
  bool isBlank() {
    return types.isEmpty() && (other.isEmpty);
  }

  @override
  String toString() {
    return 'BoshiInfo[types: $types, other: $other]';
  }
}
