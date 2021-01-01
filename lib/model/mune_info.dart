import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/model/mune_type.dart';

class MuneInfo with Aggregate {
  static const DEFAULT = MuneInfo();

  final MuneType type;

  final String other;

  const MuneInfo({this.type, this.other = ''});

  MuneInfo copyWith({MuneType type, String other}) {
    return MuneInfo(
      type: type ?? this.type,
      other: other ?? this.other,
    );
  }

  static MuneInfo random() {
    return MuneInfo(type: MuneType.random(), other: '');
  }

  @override
  bool isBlank() {
    return (type == null) && (other.isEmpty);
  }

  @override
  String toString() {
    return 'MuneInfo[type: $type, other: ${other}]';
  }
}
