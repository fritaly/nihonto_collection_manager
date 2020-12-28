import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nihonto_collection_manager/model/currency.dart';
import 'package:nihonto_collection_manager/model/geometry.dart';
import 'package:nihonto_collection_manager/model/length.dart';
import 'package:nihonto_collection_manager/model/money.dart';
import 'package:nihonto_collection_manager/model/nihonto.dart';
import 'package:nihonto_collection_manager/model/nihonto_type.dart';
import 'package:nihonto_collection_manager/extensions.dart';
import 'package:nihonto_collection_manager/model/signature.dart';
import 'package:nihonto_collection_manager/model/sori_type.dart';
import 'package:nihonto_collection_manager/utils.dart';
import 'package:nihonto_collection_manager/widget/length_widget.dart';
import 'package:nihonto_collection_manager/widget/money_widget.dart';

class NihontoForm extends StatefulWidget {
  static final TextInputFormatter decimalNumber =
      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'));

  Nihonto _nihonto;

  NihontoForm([Nihonto nihonto]) {
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

  Signature _signature = Signature.EMPTY;

  Money _price = Money(0, Currency.USD);

  Length _nagasa, _sori;

  SoriType _soriType;

  // TODO Add motohaba, sakihaba, motokasane, sakikasane, sori

  NihontoFormState(Nihonto nihonto) {
    // The argument can be null
    if (nihonto != null) {
      _type = nihonto.type;
      _geometry = nihonto.geometry;
      _signature = nihonto.signature;
      _price = nihonto.price;
      _nagasa = nihonto.nagasa;
      _sori = nihonto.sori;
      _soriType = nihonto.soriType;
    }
  }

  Nihonto _createNihonto() {
    return Nihonto(
        type: _type,
        geometry: _geometry,
        signature: _signature,
        price: _price,
        nagasa: _nagasa,
        sori: _sori,
        soriType: _soriType);
  }

  void _reset() {
    setState(() {
      _signature = Signature.EMPTY;
      _type = null;
      _geometry = null;
      _price = Money.ZERO;
      _nagasa = null;
      _sori = null;
      _soriType = null;
    });
  }

  void _randomize() {
    setState(() {
      var random = Nihonto.random();

      _signature = random.signature;
      _geometry = random.geometry;
      _type = random.type;
      _price = random.price;
      _nagasa = random.nagasa;
      _sori = random.sori;
      _soriType = random.soriType;
    });
  }

  void _save() {
    // Validate returns true if the form is valid, otherwise false.
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Saved data')));

      // Pass the entry created to the navigator and display the previous screen
      var created = _createNihonto();

      Navigator.pop(context, created);
    }
  }

  AlertDialog _showPriceDialog(BuildContext context, Money money) {
    // Money can be null
    assert(context != null);

    final key = GlobalKey<MoneyWidgetState>();

    var form = MoneyWidget(money: money, key: key);

    final AlertDialog dialog = AlertDialog(
      title: Text('Set the price'),
      contentPadding: EdgeInsets.zero,
      content: form,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          // Return the new price to the caller via the navigator stack
          onPressed: () {
            var data = key.currentState.getMoney();

            print('Data: ${data}');

            return Navigator.pop(context, data);
          },
          child: Text('OK'),
        ),
      ],
    );

    return dialog;
  }

  AlertDialog _showNagasaDialog(BuildContext context, Length length) {
    // length can be null
    assert(context != null);

    final key = GlobalKey<LengthWidgetState>();

    var form = LengthWidget(length: length, key: key);

    final AlertDialog dialog = AlertDialog(
      title: Text('Set the nagasa'),
      contentPadding: EdgeInsets.zero,
      content: form,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          // Return the new price to the caller via the navigator stack
          onPressed: () {
            var data = key.currentState.getLength();

            print('Data: ${data}');

            return Navigator.pop(context, data);
          },
          child: Text('OK'),
        ),
      ],
    );

    return dialog;
  }

  AlertDialog _showSoriDialog(BuildContext context, Length length) {
    // length can be null
    assert(context != null);

    final key = GlobalKey<LengthWidgetState>();

    var form = LengthWidget(length: length, key: key);

    final AlertDialog dialog = AlertDialog(
      title: Text('Set the sori'),
      contentPadding: EdgeInsets.zero,
      content: form,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          // Return the new price to the caller via the navigator stack
          onPressed: () {
            var data = key.currentState.getLength();

            print('Data: ${data}');

            return Navigator.pop(context, data);
          },
          child: Text('OK'),
        ),
      ],
    );

    return dialog;
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
            decoration: InputDecoration(labelText: 'Signature (romaji)'),
            initialValue: _signature.romaji,
            key: Key(
                'Signature-${_signature.romaji}'), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
            onChanged: (value) {
              setState(() {
                _signature = _signature.copyWith(romaji: value);
              });

              _formKey.currentState.validate();
            },
          ),

          TextFormField(
            decoration: InputDecoration(labelText: 'Signature (kanji)'),
            initialValue: _signature.kanji,
            key: Key(
                'Signature-${_signature.kanji}'), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
            onChanged: (value) {
              setState(() {
                _signature = _signature.copyWith(kanji: value);
              });

              _formKey.currentState.validate();
            },
          ),

          SwitchListTile(
              title: Text('Mumei'),
              value: _signature.mumei,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(() {
                  _signature = _signature.copyWith(mumei: value);
                });
              }),

          SwitchListTile(
              title: Text('Gimei'),
              value: _signature.gimei,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(() {
                  _signature = _signature.copyWith(gimei: value);
                });
              }),

          SwitchListTile(
              title: Text('Modern'),
              value: _signature.modern,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(() {
                  _signature = _signature.copyWith(modern: value);
                });
              }),

          // ============= //
          // === Price === //
          // ============= //

          TextFormField(
            decoration: InputDecoration(labelText: 'Price'),
            readOnly: true,
            initialValue: "${_price.toText()}",
            key: Key(
                'Price-${_price.toText()}'), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _showPriceDialog(context, _price);
                  }).then((value) {
                if (value != null) {
                  setState(() {
                    // Update the price based on the value returned by the dialog
                    _price = value;

                    print("Price set to ${value}");
                  });
                } else {
                  // The value is null if the user clicked "Cancel"
                }
              });
            },
          ),

          // ============== //
          // === Nagasa === //
          // ============== //

          TextFormField(
            decoration: InputDecoration(labelText: 'Nagasa'),
            readOnly: true,
            initialValue: "${_nagasa?.toText() ?? ''}",
            key: Key(
                'Nagasa-${_nagasa?.toText()}'), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _showNagasaDialog(context, _nagasa);
                  }).then((value) {
                if (value != null) {
                  setState(() {
                    // Update the nagasa based on the value returned by the dialog
                    _nagasa = value;

                    print("Nagasa set to ${value}");
                  });
                } else {
                  // The value is null if the user clicked "Cancel"
                }
              });
            },
          ),

          // ============ //
          // === Sori === //
          // ============ //

          TextFormField(
            decoration: InputDecoration(labelText: 'Sori'),
            readOnly: true,
            initialValue: "${_sori?.toText() ?? ''}",
            key: Key(
                'Sori-${_sori?.toText()}'), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _showSoriDialog(context, _sori);
                  }).then((value) {
                if (value != null) {
                  setState(() {
                    // Update the sori based on the value returned by the dialog
                    _sori = value;

                    print("Sori set to ${value}");
                  });
                } else {
                  // The value is null if the user clicked "Cancel"
                }
              });
            },
          ),

          // ================= //
          // === Sori Type === //
          // ================= //

          DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Sori type'),
              value: _soriType,
              items: Utils.getSoriTypeMenuItems(),
              onChanged: (value) {
                setState(() {
                  _soriType = value;
                });
              }),

          // =============== //
          // === Buttons === //
          // =============== //

          ButtonBar(children: [
            ElevatedButton(child: Text('Reset'), onPressed: _reset),
            ElevatedButton(child: Text('Randomize'), onPressed: _randomize),
            ElevatedButton(child: Text('Save'), onPressed: _save)
          ])
        ])).pad();
  }
}
