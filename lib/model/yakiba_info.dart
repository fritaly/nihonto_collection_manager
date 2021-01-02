import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/yakiba.dart';

class YakibaInfo with Aggregate {

  static const DEFAULT = YakibaInfo();

  final EnumSet<Yakiba> types;

  final String other;

  const YakibaInfo({ this.types = const EnumSet.empty(), this.other = '' });

  YakibaInfo copyWith({EnumSet<Yakiba> types, String other}) {
    return YakibaInfo(
      types: types ?? this.types,
      other: other ?? this.other,
    );
  }

  static YakibaInfo random() {
    return YakibaInfo(types: EnumSet.random(Yakiba.values), other: '');
  }

  @override
  bool isBlank() {
    return types.isEmpty() && (other.isEmpty);
  }

  @override
  String toString() {
    return 'YakibaInfo[types: $types, other: $other]';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YakibaInfo &&
          runtimeType == other.runtimeType &&
          types == other.types &&
          other == other.other;

  @override
  int get hashCode => types.hashCode ^ other.hashCode;
}