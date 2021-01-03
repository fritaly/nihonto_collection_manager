import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nihonto_collection_manager/extensions.dart';
import 'package:nihonto_collection_manager/utils.dart';
import 'package:nihonto_collection_manager/model/currency.dart';
import 'package:nihonto_collection_manager/model/money.dart';

class MoneyWidget extends StatefulWidget {
  static final TextInputFormatter decimalNumber =
      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'));

  // Can be null
  Money _money;

  MoneyWidget({Key key, Money money}) : super(key: key) {
    _money = money;
  }

  @override
  MoneyWidgetState createState() => MoneyWidgetState(_money);
}

class MoneyWidgetState extends State<MoneyWidget> {
  int _amount;
  Currency _currency;

  MoneyWidgetState([Money money]) {

    if (money != null) {
      this._amount = money.amount;
      this._currency = money.currency;
    }
  }

  Money getMoney() {
    return Money((builder) => builder
      ..amount = _amount
      ..currency = _currency
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      TextFormField(
        decoration: InputDecoration(labelText: 'Price', border: OutlineInputBorder()),
        initialValue: "${_amount}",
        key: Key(_amount.toString()),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          setState(() {
            _amount = int.parse(value);
          });
        },
      ),
      SizedBox(height: 8),
      DropdownButtonFormField(
          decoration: InputDecoration(labelText: 'Currency', border: OutlineInputBorder()),
          value: _currency,
          key: Key(_currency.name),
          items: Utils.getDropDownMenuItems(Currency.values),
          onChanged: (value) {
            setState(() {
              _currency = value;
            });
          }),
    ]).pad();
  }
}
