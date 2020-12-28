import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nihonto_collection_manager/model/Currency.dart';
import 'package:nihonto_collection_manager/model/Geometry.dart';
import 'package:nihonto_collection_manager/model/Length.dart';
import 'package:nihonto_collection_manager/model/Money.dart';
import 'package:nihonto_collection_manager/model/Nihonto.dart';
import 'package:nihonto_collection_manager/model/NihontoType.dart';
import 'package:nihonto_collection_manager/Utils.dart';
import 'package:nihonto_collection_manager/Extensions.dart';

class NihontoForm extends StatefulWidget {

  static final TextInputFormatter decimalNumber = FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'));

  Nihonto _nihonto;

  NihontoForm([ Nihonto nihonto ]) {
    _nihonto = nihonto;
  }

  @override
  NihontoFormState createState() => NihontoFormState(_nihonto);
}

class NihontoFormState extends State<NihontoForm> {
  // Create a global key that uniquely identifies the Form widget and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`, not a GlobalKey<NihontoFormState>.
  final _formKey = GlobalKey<FormState>();

  NihontoType _type;

  Geometry _geometry;

  String _signature;

  Money _price = Money(0, Currency.USD);

  Length _nagasa;

  NihontoFormState(Nihonto nihonto) {
    // The argument can be null
    if (nihonto != null) {
      _type = nihonto.type;
      _geometry = nihonto.geometry;
      _signature = nihonto.signature;
      _price = nihonto.price;
      _nagasa = nihonto.nagasa;
    }
  }

  Nihonto _createNihonto() {
    return Nihonto(_type, _geometry, _signature, price: _price, nagasa: _nagasa);
  }

  void _reset() {
    setState(() {
      _signature = "";
      _type = null;
      _geometry = null;
      _price = Money.ZERO;
      _nagasa = null;
    });
  }

  void _populateData() {
    setState(() {
      var random = Nihonto.random();

      _signature = random.signature;
      _geometry = random.geometry;
      _type = random.type;
      _price = random.price;
      _nagasa = Length.random();
    });
  }

  void _save() {
    // Validate returns true if the form is valid, otherwise false.
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Saved data')));

      // Pass the entry created to the navigator and display the previous screen
      var created = _createNihonto();

      Navigator.pop(context, created);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[

          // ============ //
          // === Type === //
          // ============ //

          DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Type'),
              value: _type,
              items: Utils.getNihontoTypeMenuItems(),
              validator: (value) {
                if (value == null) {
                  return 'Required';
                }

                return null;
              },
              onChanged: (value) {
                setState(() {
                  _type = value;
                });

                _formKey.currentState.validate();
              }),

          // ================ //
          // === Geometry === //
          // ================ //

          DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Geometry'),
              value: _geometry,
              items: Utils.getGeometryMenuItems(),
              validator: (value) {
                if (value == null) {
                  return 'Required';
                }

                return null;
              },
              onChanged: (value) {
                setState(() {
                  _geometry = value;
                });

                _formKey.currentState.validate();
              }),

          // ================= //
          // === Signature === //
          // ================= //

          TextFormField(
            decoration: InputDecoration(labelText: 'Signature'),
            initialValue: _signature,
            key: Key('Signature-${_signature}'), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
            validator: (value) {
              if (value.isEmpty) {
                return 'Required';
              }

              return null;
            },
            onChanged: (value) {
              setState(() {
                _signature = value;
              });

              _formKey.currentState.validate();
            },
          ),

          // ============= //
          // === Price === //
          // ============= //

          TextFormField(
            decoration: InputDecoration(labelText: 'Price'),
            initialValue: "${_price.amount}",
            key: Key(_price.amount.toString()), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ]
          ),

          DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Currency'),
              value: _price.currency,
              key: Key(_price.currency.name()), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
              items: Utils.getCurrencyMenuItems(),
              onChanged: (value) {

              }),

          // ============== //
          // === Nagasa === //
          // ============== //

          TextFormField(
              decoration: InputDecoration(labelText: 'Nagasa'),
              initialValue: _nagasa?.value?.toString() ?? '',
              key: Key("Nagasa-${_nagasa?.value}"), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                NihontoForm.decimalNumber
              ],
            validator: (value) {
                if (!Utils.isDoubleValue(value)) {
                  return 'Invalid value';
                }

                return null;
            },
            onChanged: (value) {
                // TODO To implement
              setState(() {
                _nagasa = Length(double.parse(value), _nagasa.unit);

                print("Nagasa set to ${_nagasa}");
              });
            },
          ),

          // =============== //
          // === Buttons === //
          // =============== //

          ButtonBar(children: [
            ElevatedButton(
                child: Text('Reset'),
                onPressed: _reset
            ),
            ElevatedButton(
                child: Text('Randomize'),
                onPressed: _populateData
            ),
            ElevatedButton(
                child: Text('Save'),
                onPressed: _save
            )
          ])
        ])).pad();
  }
}