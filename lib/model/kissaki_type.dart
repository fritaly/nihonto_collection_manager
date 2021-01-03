import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'kissaki_type.g.dart';

class KissakiType extends EnumClass {

  static Serializer<KissakiType> get serializer => _$kissakiTypeSerializer;

  static const KissakiType KO_KISSAKI = _$KO_KISSAKI;
  static const KissakiType CHU_KISSAKI = _$CHU_KISSAKI;
  static const KissakiType O_KISSAKI = _$O_KISSAKI;
  static const KissakiType IKUBI_KISSAKI = _$IKUBI_KISSAKI;
  static const KissakiType IKARI_KISSAKI = _$IKARI_KISSAKI;
  static const KissakiType KAMASU_KISSAKI = _$KAMASU_KISSAKI;
  static const KissakiType MOROHA_KISSAKI = _$MOROHA_KISSAKI;
  static const KissakiType OTHER = _$OTHER;

  const KissakiType._(String name) : super(name);

  static BuiltSet<KissakiType> get values => _$values;
  static KissakiType valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case KO_KISSAKI:
        return 'Ko kissaki';
      case CHU_KISSAKI:
        return 'Chu kissaki';
      case O_KISSAKI:
        return 'O kissaki';
      case IKUBI_KISSAKI:
        return 'Ikubi kissaki';
      case IKARI_KISSAKI:
        return 'Ikari kissaki';
      case KAMASU_KISSAKI:
        return 'Kamasu kissaki';
      case MOROHA_KISSAKI:
        return 'Moroha kissaki';
      case OTHER:
        return 'Other';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static KissakiType random() => Utils.random(values.toList());
}