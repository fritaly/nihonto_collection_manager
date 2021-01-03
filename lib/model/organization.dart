import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/labelled.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'organization.g.dart';

class Organization extends EnumClass with Labelled {

  static Serializer<Organization> get serializer => _$organizationSerializer;

  static const Organization NBTHK = _$NBTHK;
  static const Organization NTHK = _$NTHK;
  static const Organization NTHK_NPO = _$NTHK_NPO;
  static const Organization OTHER = _$OTHER;

  const Organization._(String name) : super(name);

  static BuiltSet<Organization> get values => _$values;
  static Organization valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case NBTHK:
        return 'NBTHK';
      case NTHK:
        return 'NTHK';
      case NTHK_NPO:
        return 'NTHK-NPO';
      case OTHER:
        return 'Other';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static Organization random() => Utils.random(values.toList());
}