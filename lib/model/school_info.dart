import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/utils.dart';

class SchoolInfo with Aggregate {

  static const DEFAULT = SchoolInfo();

  final String school;

  const SchoolInfo({ this.school = '' });

  SchoolInfo copyWith({String school}) {
    return SchoolInfo(
      school: school ?? this.school,
    );
  }

  static SchoolInfo random() {
    return SchoolInfo(school: Utils.random([ 'Uda', 'Bizen', 'Yamashiro', 'Mizuta', 'Soshu', 'Mino', 'Yamato' ]));
  }

  @override
  bool isBlank() {
    return (school.isEmpty);
  }

  @override
  String toString() {
    return 'SchoolInfo[school: $school]';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchoolInfo &&
          runtimeType == other.runtimeType &&
          school == other.school;

  @override
  int get hashCode => school.hashCode;
}