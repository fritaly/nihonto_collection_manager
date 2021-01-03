
import 'package:built_value/built_value.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/model/polish_type.dart';
import 'package:nihonto_collection_manager/model/sugata.dart';

part 'polish_info.g.dart';

abstract class PolishInfo with Aggregate implements Built<PolishInfo, PolishInfoBuilder> {

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(PolishInfoBuilder builder) => builder
    ..other = '';

  PolishInfo._();

  factory PolishInfo([updates(PolishInfoBuilder b)]) = _$PolishInfo;

  @nullable
  PolishType get type;

  String get other;

  static PolishInfo random() {
    return PolishInfo((builder) => builder
      ..type = PolishType.random()
      ..other = '');
  }

  @override
  bool isBlank() {
    return (type == null) && other.isEmpty;
  }
}
