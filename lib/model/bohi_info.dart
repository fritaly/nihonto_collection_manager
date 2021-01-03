
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/model/bohi.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'bohi_info.g.dart';

abstract class BohiInfo with Aggregate implements Built<BohiInfo, BohiInfoBuilder> {

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(BohiInfoBuilder builder) => builder
    ..other = '';

  BohiInfo._();

  factory BohiInfo([updates(BohiInfoBuilder b)]) = _$BohiInfo;

  String get other;

  BuiltSet<Bohi> get types;

  static BohiInfo random() {
    return BohiInfo((builder) => builder
      ..types.addAll(Utils.randomIterable(Bohi.values))
      ..other = '');
  }

  @override
  bool isBlank() {
    return types.isEmpty && other.isEmpty;
  }
}
