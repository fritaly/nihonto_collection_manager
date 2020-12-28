import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nihonto_collection_manager/Extensions.dart';
import 'package:nihonto_collection_manager/Utils.dart';
import 'package:nihonto_collection_manager/model/Money.dart';

class MoneyForm extends StatefulWidget {

  static final TextInputFormatter decimalNumber = FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'));

  Money _money;

  MoneyForm([ Money money = Money.ZERO ]) {
    _money = money;
  }

  @override
  MoneyFormState createState() => MoneyFormState(_money);
}

class MoneyFormState extends State<MoneyForm> {
  Money _money;

  MoneyFormState([ Money money = Money.ZERO ]) {
    this._money = money;
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min,
            children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Price'),
            initialValue: "${_money.amount}",
            key: Key(_money.amount.toString()), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ]
          ),

          DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Currency'),
              value: _money.currency,
              key: Key(_money.currency.name()), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
              items: Utils.getCurrencyMenuItems(),
              onChanged: (value) {
              }),
        ]).pad();
  }
}