import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/labelled.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'yasurime.g.dart';

class Yasurime extends EnumClass with Labelled {

  static Serializer<Yasurime> get serializer => _$yasurimeSerializer;

  static const Yasurime KIRI = _$KIRI;
  static const Yasurime KATTESAGARI = _$KATTESAGARI;
  static const Yasurime HIGAKI = _$HIGAKI;
  static const Yasurime TAKANOHA = _$TAKANOHA;
  static const Yasurime SUJIKAI = _$SUJIKAI;
  static const Yasurime OTHER = _$OTHER;

  const Yasurime._(String name) : super(name);

  static BuiltSet<Yasurime> get values => _$values;
  static Yasurime valueOf(String name) => _$valueOf(name);

  String get label {
    switch(this) {
      case KIRI:
        return 'Kiri';
      case KATTESAGARI:
        return 'Kattesagari';
      case HIGAKI:
        return 'Higaki';
      case TAKANOHA:
        return 'Taka no ha';
      case SUJIKAI:
        return 'Sujikai';
      case OTHER:
        return 'Other';

      default:
        throw Exception('Unsupported value: ${this}');
    }
  }

  static Yasurime random() => Utils.random(values.toList());
}