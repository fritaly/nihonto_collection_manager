
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/model/boshi.dart';
import 'package:nihonto_collection_manager/model/hamon_type.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'hamon_info.g.dart';

abstract class HamonInfo with Aggregate implements Built<HamonInfo, HamonInfoBuilder> {

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(HamonInfoBuilder builder) => builder
    ..other = '';

  HamonInfo._();

  factory HamonInfo([updates(HamonInfoBuilder b)]) = _$HamonInfo;

  String get other;

  BuiltSet<HamonType> get types;

  static HamonInfo random() {
    return HamonInfo((builder) => builder
      ..types.addAll(Utils.randomIterable(HamonType.values))
      ..other = '');
  }

  @override
  bool isBlank() {
    return types.isEmpty && other.isEmpty;
  }
}
