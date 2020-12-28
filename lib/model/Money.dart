import 'dart:math';

import 'package:nihonto_collection_manager/Extensions.dart';
import 'package:nihonto_collection_manager/model/Currency.dart';

class Money {

  static const ZERO = Money(0, Currency.USD);

  final int amount;
  final Currency currency;

  const Money(this.amount, this.currency);

  String toText() {
    return "${amount} ${currency.name()}";
  }

  String toString() {
    return toText();
  }

  static Money random() {
    return Money((Random().nextInt(100) * 50) + 1500, Currency.USD);
  }
}