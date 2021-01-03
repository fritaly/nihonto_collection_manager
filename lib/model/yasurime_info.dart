
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/model/boshi.dart';
import 'package:nihonto_collection_manager/model/yasurime.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'yasurime_info.g.dart';

abstract class YasurimeInfo with Aggregate implements Built<YasurimeInfo, YasurimeInfoBuilder> {

  static Serializer<YasurimeInfo> get serializer => _$yasurimeInfoSerializer;

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(YasurimeInfoBuilder builder) => builder
    ..other = '';

  YasurimeInfo._();

  factory YasurimeInfo([updates(YasurimeInfoBuilder b)]) = _$YasurimeInfo;

  String get other;

  BuiltSet<Yasurime> get types;

  static YasurimeInfo random() {
    return YasurimeInfo((builder) => builder
      ..types.addAll(Utils.randomIterable(Yasurime.values))
      ..other = '');
  }

  @override
  bool isBlank() {
    return types.isEmpty && other.isEmpty;
  }
}
