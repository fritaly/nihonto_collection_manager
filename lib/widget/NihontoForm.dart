import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nihonto_collection_manager/model/Currency.dart';
import 'package:nihonto_collection_manager/model/Geometry.dart';
import 'package:nihonto_collection_manager/model/Money.dart';
import 'package:nihonto_collection_manager/model/Nihonto.dart';
import 'package:nihonto_collection_manager/model/NihontoType.dart';
import 'package:nihonto_collection_manager/Utils.dart';
import 'package:nihonto_collection_manager/Extensions.dart';

class NihontoForm extends StatefulWidget {

  Nihonto _nihonto;

  NihontoForm(Nihonto nihonto) {
    // The argument can be null
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

  NihontoFormState(Nihonto nihonto) {
    // The argument can be null
    if (nihonto != null) {
      _type = nihonto.type;
      _geometry = nihonto.geometry;
      _signature = nihonto.signature;
      _price = nihonto.price;
    }
  }

  Nihonto _createNihonto() {
    return Nihonto(_type, _geometry, _signature, price: _price);
  }

  void _reset() {
    setState(() {
      _signature = "";
      _type = null;
      _geometry = null;
      _price = Money.ZERO;
    });
  }

  void _populateData() {
    setState(() {
      _signature = "MASAMUNE";
      _geometry = Geometry.SHINOGI_ZUKURI;
      _type = NihontoType.KATANA;
      _price = Money(1500, Currency.USD);
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
      Navigator.pop(context, _createNihonto());
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
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
          TextFormField(
            initialValue: _signature,
            decoration: InputDecoration(labelText: 'Signature'),
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
          TextFormField(
            decoration: InputDecoration(labelText: 'Price'),
            initialValue: "${_price.amount}",
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ]
          ),
          DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Currency'),
              value: _price.currency,
              items: Utils.getCurrencyMenuItems(),
              onChanged: (value) {

              },),
          ButtonBar(children: [
            ElevatedButton(
                child: Text('Reset'),
                onPressed: _reset
            ),
            ElevatedButton(
                child: Text('Test Data'),
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