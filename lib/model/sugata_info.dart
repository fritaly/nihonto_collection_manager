import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/model/sugata.dart';

class SugataInfo with Aggregate {

  static const DEFAULT = SugataInfo();

  final Sugata type;

  final String other;

  const SugataInfo({Sugata this.type, String this.other = ''});

  SugataInfo copyWith({Sugata type, String other}) {
    return SugataInfo(type: type ?? this.type, other: other ?? this.other);
  }

  static SugataInfo random() {
    return SugataInfo(type: Sugata.random(), other: '');
  }

  @override
  bool isBlank() {
    return (type == null) && (other.isEmpty);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SugataInfo &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          other == other.other;

  @override
  int get hashCode => type.hashCode ^ other.hashCode;
}
