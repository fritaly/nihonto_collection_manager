
import 'package:built_value/built_value.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/model/length.dart';
import 'package:nihonto_collection_manager/model/length_unit.dart';
import 'package:nihonto_collection_manager/model/sori_type.dart';

part 'sori_info.g.dart';

abstract class SoriInfo with Aggregate implements Built<SoriInfo, SoriInfoBuilder> {

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(SoriInfoBuilder builder) => builder
    ..other = '';

  SoriInfo._();

  factory SoriInfo([updates(SoriInfoBuilder b)]) = _$SoriInfo;

  @nullable
  SoriType get type;

  @nullable
  Length get sori;

  String get other;

  static SoriInfo random() {
    return SoriInfo((builder) => builder
      ..type = SoriType.random()
      ..sori = Length.random(LengthUnit.CM, min: 0, max: 3)
      ..other = '');
  }

  @override
  bool isBlank() {
    return (type == null) && (sori == null) && (other.isEmpty);
  }
}
