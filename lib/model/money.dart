
import 'dart:math';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nihonto_collection_manager/model/currency.dart';

part 'money.g.dart';

abstract class Money implements Built<Money, MoneyBuilder> {

  static Serializer<Money> get serializer => _$moneySerializer;

  // See https://github.com/google/built_value.dart/issues/212#issuecomment-632702910
  static void _initializeBuilder(MoneyBuilder builder) => builder
    ..amount = 0;

  Money._();

  factory Money([updates(MoneyBuilder b)]) = _$Money;

  int get amount;

  Currency get currency;

  String toText() {
    return "${amount} ${currency.name}";
  }

  static Money random() {
    return Money((builder) => builder
      ..amount = (Random().nextInt(100) * 50) + 1500
      ..currency = Currency.USD);
  }
}
