import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/utils.dart';

part 'currency.g.dart';

class Currency extends EnumClass {

  static Serializer<Currency> get serializer => _$currencySerializer;

  static const Currency USD = _$USD;
  static const Currency EUR = _$EUR;
  static const Currency AUD = _$AUD;
  static const Currency JPY = _$JPY;
  static const Currency GBP = _$GBP;

  const Currency._(String name) : super(name);

  static BuiltSet<Currency> get values => _$values;
  static Currency valueOf(String name) => _$valueOf(name);

  static Currency random() => Utils.random(values.toList());
}