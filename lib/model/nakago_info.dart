
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/model/nakago.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'nakago_info.g.dart';

abstract class NakagoInfo with Aggregate implements Built<NakagoInfo, NakagoInfoBuilder> {

  static Serializer<NakagoInfo> get serializer => _$nakagoInfoSerializer;

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(NakagoInfoBuilder builder) => builder
    ..other = '';

  NakagoInfo._();

  factory NakagoInfo([updates(NakagoInfoBuilder b)]) = _$NakagoInfo;

  String get other;

  BuiltSet<Nakago> get types;

  static NakagoInfo random() {
    return NakagoInfo((builder) => builder
      ..types.addAll(Utils.randomIterable(Nakago.values))
      ..other = '');
  }

  @override
  bool isBlank() {
    return types.isEmpty && other.isEmpty;
  }
}
