
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/aggregate.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'school_info.g.dart';

abstract class SchoolInfo with Aggregate implements Built<SchoolInfo, SchoolInfoBuilder> {

  static Serializer<SchoolInfo> get serializer => _$schoolInfoSerializer;

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(SchoolInfoBuilder builder) => builder
    ..school = '';

  SchoolInfo._();

  factory SchoolInfo([updates(SchoolInfoBuilder b)]) = _$SchoolInfo;

  String get school;

  static SchoolInfo random() {
    return SchoolInfo((builder) => builder
      ..school = Utils.random([ 'Uda', 'Bizen', 'Yamashiro', 'Mizuta', 'Soshu', 'Mino', 'Yamato' ]));
  }

  @override
  bool isBlank() {
    return school.isEmpty;
  }
}