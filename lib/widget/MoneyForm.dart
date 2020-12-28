import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nihonto_collection_manager/Extensions.dart';
import 'package:nihonto_collection_manager/Utils.dart';
import 'package:nihonto_collection_manager/model/Currency.dart';
import 'package:nihonto_collection_manager/model/Money.dart';

class MoneyForm extends StatefulWidget {
  static final TextInputFormatter decimalNumber =
      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'));

  Money _money;

  MoneyForm({Key key, Money money = Money.ZERO}) : super(key: key) {
    _money = money;
  }

  @override
  MoneyFormState createState() => MoneyFormState(_money);
}

class MoneyFormState extends State<MoneyForm> {
  int _amount;
  Currency _currency;

  MoneyFormState([Money money = Money.ZERO]) {
    assert(money != null);

    this._amount = money.amount;
    this._currency = money.currency;
  }

  Money getMoney() {
    return Money(_amount, _currency);
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      TextFormField(
        decoration: InputDecoration(labelText: 'Price'),
        initialValue: "${_amount}",
        key: Key(_amount
            .toString()), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
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
      DropdownButtonFormField(
          decoration: InputDecoration(labelText: 'Currency'),
          value: _currency,
          key: Key(_currency
              .name()), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
          items: Utils.getCurrencyMenuItems(),
          onChanged: (value) {
            setState(() {
              _currency = value;
            });
          }),
    ]).pad();
  }
}
