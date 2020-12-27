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
}