
import 'package:built_value/built_value.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/model/kissaki_type.dart';

part 'kissaki_info.g.dart';

abstract class KissakiInfo with Aggregate implements Built<KissakiInfo, KissakiInfoBuilder> {

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(KissakiInfoBuilder builder) => builder
    ..other = '';

  KissakiInfo._();

  factory KissakiInfo([updates(KissakiInfoBuilder b)]) = _$KissakiInfo;

  @nullable
  KissakiType get type;

  String get other;

  static KissakiInfo random() {
    return KissakiInfo((builder) => builder
      ..type = KissakiType.random()
      ..other = '');
  }

  @override
  bool isBlank() {
    return (type == null) && other.isEmpty;
  }
}
