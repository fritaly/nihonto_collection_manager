import 'package:nihonto_collection_manager/Utils.dart';

enum Currency {
  USD,
  JPY,
  EUR,
  AUD,
  GBP
}

extension CurrencyExtension on Currency {

  String name() {
    return this.toString().split('.').last;
  }

  static Currency random() {
    return Utils.random(Currency.values);
  }
}