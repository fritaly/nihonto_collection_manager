
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/model/boshi.dart';
import 'package:nihonto_collection_manager/model/yakiba.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'yakiba_info.g.dart';

abstract class YakibaInfo with Aggregate implements Built<YakibaInfo, YakibaInfoBuilder> {

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(YakibaInfoBuilder builder) => builder
    ..other = '';

  YakibaInfo._();

  factory YakibaInfo([updates(YakibaInfoBuilder b)]) = _$YakibaInfo;

  String get other;

  BuiltSet<Yakiba> get types;

  static YakibaInfo random() {
    return YakibaInfo((builder) => builder
      ..types.addAll(Utils.randomIterable(Yakiba.values))
      ..other = '');
  }

  @override
  bool isBlank() {
    return types.isEmpty && other.isEmpty;
  }
}
