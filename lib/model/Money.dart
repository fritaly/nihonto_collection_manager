import 'dart:math';

import 'package:nihonto_collection_manager/model/Currency.dart';

class Money {

  static const ZERO = Money(0, Currency.USD);

  final int amount;
  final Currency currency;

  const Money(this.amount, this.currency);

  String toText() {
    return "${amount} ${currency.name()}";
  }

  static Money random() {
    return Money(Random().nextInt(5000) + 1500, Currency.USD);
  }
}