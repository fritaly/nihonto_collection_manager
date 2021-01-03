
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/model/hada_type.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'hada_info.g.dart';

abstract class HadaInfo with Aggregate implements Built<HadaInfo, HadaInfoBuilder> {

  static Serializer<HadaInfo> get serializer => _$hadaInfoSerializer;

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(HadaInfoBuilder builder) => builder
    ..other = '';

  HadaInfo._();

  factory HadaInfo([updates(HadaInfoBuilder b)]) = _$HadaInfo;

  String get other;

  BuiltSet<HadaType> get types;

  static HadaInfo random() {
    return HadaInfo((builder) => builder
      ..types.addAll(Utils.randomIterable(HadaType.values))
      ..other = '');
  }

  @override
  bool isBlank() {
    return types.isEmpty && other.isEmpty;
  }
}
