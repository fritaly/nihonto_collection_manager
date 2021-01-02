import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/model/polish_type.dart';

class PolishInfo with Aggregate {
  static const DEFAULT = PolishInfo();

  final PolishType type;

  final String other;

  const PolishInfo({this.type, this.other = ''});

  PolishInfo copyWith({PolishType type, String other}) {
    return PolishInfo(
      type: type ?? this.type,
      other: other ?? this.other,
    );
  }

  static PolishInfo random() {
    return PolishInfo(type: PolishType.random(), other: '');
  }

  @override
  bool isBlank() {
    return (type == null) && (other.isEmpty);
  }

  @override
  String toString() {
    return 'PolishInfo[type: $type, other: ${other}]';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PolishInfo &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          other == other.other;

  @override
  int get hashCode => type.hashCode ^ other.hashCode;
}
