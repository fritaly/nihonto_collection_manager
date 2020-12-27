import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/Geometry.dart';
import 'package:nihonto_collection_manager/Nihonto.dart';
import 'package:nihonto_collection_manager/NihontoType.dart';
import 'package:nihonto_collection_manager/Utils.dart';
import 'package:nihonto_collection_manager/WidgetExtension.dart';

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

  NihontoFormState(Nihonto nihonto) {
    // The argument can be null
    if (nihonto != null) {
      _type = nihonto.type;
      _geometry = nihonto.geometry;
      _signature = nihonto.signature;
    }
  }

  Nihonto _createNihonto() {
    return Nihonto(_type, _geometry, _signature);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Reset'),
                onPressed: () {
                  setState(() {
                    _signature = "";
                    _type = null;
                    _geometry = null;
                  });
                },
              ).pad(),
              ElevatedButton(
                child: Text('Test Data'),
                onPressed: () {
                  setState(() {
                    _signature = "MASAMUNE";
                    _geometry = Geometry.SHINOGI_ZUKURI;
                    _type = NihontoType.KATANA;
                  });
                },
              ).pad(),
              ElevatedButton(
                child: Text('Save'),
                onPressed: () {
                  // Validate returns true if the form is valid, otherwise false.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.

                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Saved data')));

                    // Pass the entry created to the navigator and display the previous screen
                    Navigator.pop(context, _createNihonto());
                  }
                },
              ).pad()
            ],
          )
        ])).pad();
  }
}