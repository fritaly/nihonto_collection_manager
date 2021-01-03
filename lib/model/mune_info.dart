
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/model/mune_type.dart';

part 'mune_info.g.dart';

abstract class MuneInfo with Aggregate implements Built<MuneInfo, MuneInfoBuilder> {

  static Serializer<MuneInfo> get serializer => _$muneInfoSerializer;

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(MuneInfoBuilder builder) => builder
    ..other = '';

  MuneInfo._();

  factory MuneInfo([updates(MuneInfoBuilder b)]) = _$MuneInfo;

  @nullable
  MuneType get type;

  String get other;

  static MuneInfo random() {
    return MuneInfo((builder) => builder
      ..type = MuneType.random()
      ..other = '');
  }

  @override
  bool isBlank() {
    return (type == null) && other.isEmpty;
  }
}
