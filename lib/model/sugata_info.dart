
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/model/sugata.dart';

part 'sugata_info.g.dart';

abstract class SugataInfo with Aggregate implements Built<SugataInfo, SugataInfoBuilder> {

  static Serializer<SugataInfo> get serializer => _$sugataInfoSerializer;

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(SugataInfoBuilder builder) => builder
    ..other = '';

  SugataInfo._();

  factory SugataInfo([updates(SugataInfoBuilder b)]) = _$SugataInfo;

  @nullable
  Sugata get type;

  String get other;

  static SugataInfo random() {
    return SugataInfo((builder) => builder
      ..type = Sugata.random()
      ..other = '');
  }

  @override
  bool isBlank() {
    return (type == null) && other.isEmpty;
  }
}
