
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/model/boshi.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'boshi_info.g.dart';

abstract class BoshiInfo with Aggregate implements Built<BoshiInfo, BoshiInfoBuilder> {

  static Serializer<BoshiInfo> get serializer => _$boshiInfoSerializer;

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(BoshiInfoBuilder builder) => builder
    ..other = '';

  BoshiInfo._();

  factory BoshiInfo([updates(BoshiInfoBuilder b)]) = _$BoshiInfo;

  String get other;

  BuiltSet<Boshi> get types;

  static BoshiInfo random() {
    return BoshiInfo((builder) => builder
      ..types.addAll(Utils.randomIterable(Boshi.values))
      ..other = '');
  }

  @override
  bool isBlank() {
    return types.isEmpty && other.isEmpty;
  }
}
