import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'mune_type.g.dart';

class MuneType extends EnumClass {

  static Serializer<MuneType> get serializer => _$muneTypeSerializer;

  static const MuneType IORI = _$IORI;
  static const MuneType TAKASHI = _$TAKASHI;
  static const MuneType HIKUSHI = _$HIKUSHI;
  static const MuneType HIRA = _$HIRA;
  static const MuneType MITSU = _$MITSU;
  static const MuneType MARU = _$MARU;
  static const MuneType OTHER = _$OTHER;

  const MuneType._(String name) : super(name);

  static BuiltSet<MuneType> get values => _$values;
  static MuneType valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case IORI:
        return 'Iori';
      case TAKASHI:
        return 'Takashi';
      case HIKUSHI:
        return 'Hikushi';
      case HIRA:
        return 'Hira';
      case MITSU:
        return 'Mitsu';
      case MARU:
        return 'Maru';
      case OTHER:
        return 'Other';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static MuneType random() => Utils.random(values.toList());
}