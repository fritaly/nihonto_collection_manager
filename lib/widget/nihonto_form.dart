import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nihonto_collection_manager/extensions.dart';
import 'package:nihonto_collection_manager/model/boshi.dart';
import 'package:nihonto_collection_manager/model/boshi_info.dart';
import 'package:nihonto_collection_manager/model/currency.dart';
import 'package:nihonto_collection_manager/model/geometry.dart';
import 'package:nihonto_collection_manager/model/hada.dart';
import 'package:nihonto_collection_manager/model/hada_info.dart';
import 'package:nihonto_collection_manager/model/hamon_info.dart';
import 'package:nihonto_collection_manager/model/hamon_type.dart';
import 'package:nihonto_collection_manager/model/kissaki_type.dart';
import 'package:nihonto_collection_manager/model/length.dart';
import 'package:nihonto_collection_manager/model/money.dart';
import 'package:nihonto_collection_manager/model/mune_type.dart';
import 'package:nihonto_collection_manager/model/nakago.dart';
import 'package:nihonto_collection_manager/model/nakago_info.dart';
import 'package:nihonto_collection_manager/model/nihonto.dart';
import 'package:nihonto_collection_manager/model/nihonto_type.dart';
import 'package:nihonto_collection_manager/model/signature.dart';
import 'package:nihonto_collection_manager/model/sori_info.dart';
import 'package:nihonto_collection_manager/model/yakiba.dart';
import 'package:nihonto_collection_manager/model/yakiba_info.dart';
import 'package:nihonto_collection_manager/model/yasurime.dart';
import 'package:nihonto_collection_manager/model/yasurime_info.dart';
import 'package:nihonto_collection_manager/utils.dart';
import 'package:nihonto_collection_manager/widget/length_widget.dart';
import 'package:nihonto_collection_manager/widget/money_widget.dart';
import 'package:nihonto_collection_manager/widget/multiselect_formfield.dart';

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

  Length _nagasa, _totalLength, _kasane, _motokasane;

  SoriInfo _sori = SoriInfo();

  HadaInfo _hada = HadaInfo();

  KissakiType _kissakiType;

  MuneType _muneType;

  HamonInfo _hamonInfo = HamonInfo();

  YakibaInfo _yakibaInfo = YakibaInfo();

  BoshiInfo _boshiInfo = BoshiInfo();

  NakagoInfo _nakagoInfo = NakagoInfo();

  YasurimeInfo _yasurimeInfo = YasurimeInfo();

  // TODO Add motohaba, sakihaba, motokasane, sakikasane

  NihontoFormState(Nihonto nihonto) {
    // The argument can be null
    if (nihonto != null) {
      _type = nihonto.type;
      _geometry = nihonto.geometry;
      _signature = nihonto.signature;
      _price = nihonto.price;
      _nagasa = nihonto.nagasa;
      _totalLength = nihonto.totalLength;
      _kasane = nihonto.kasane;
      _motokasane = nihonto.motokasane;
      _sori = nihonto.sori;
      _hada = nihonto.hada;
      _kissakiType = nihonto.kissakiType;
      _muneType = nihonto.muneType;
      _hamonInfo = nihonto.hamonInfo;
      _yakibaInfo = nihonto.yakibaInfo;
      _boshiInfo = nihonto.boshiInfo;
      _nakagoInfo = nihonto.nakagoInfo;
      _yasurimeInfo = nihonto.yasurimeInfo;
    }
  }

  Nihonto _createNihonto() {
    return Nihonto(
        type: _type,
        geometry: _geometry,
        signature: _signature,
        price: _price,
        nagasa: _nagasa,
        totalLength: _totalLength,
        kasane: _kasane,
        motokasane: _motokasane,
        sori: _sori,
        hada: _hada,
        kissakiType: _kissakiType,
        muneType: _muneType,
        hamonInfo: _hamonInfo,
        yakibaInfo: _yakibaInfo,
        boshiInfo: _boshiInfo,
        nakagoInfo: _nakagoInfo,
        yasurimeInfo: _yasurimeInfo
    );
  }

  void _reset() {
    setState(() {
      _signature = Signature.EMPTY;
      _type = null;
      _geometry = null;
      _price = Money.ZERO;
      _nagasa = null;
      _totalLength = null;
      _kasane = null;
      _motokasane = null;
      _sori = SoriInfo();
      _hada = HadaInfo();
      _kissakiType = null;
      _muneType = null;
      _hamonInfo = HamonInfo();
      _yakibaInfo = YakibaInfo();
      _boshiInfo = BoshiInfo();
      _nakagoInfo = NakagoInfo();
      _yasurimeInfo = YasurimeInfo();
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
      _totalLength = random.totalLength;
      _kasane = random.kasane;
      _motokasane = random.motokasane;
      _sori = random.sori;
      _hada = random.hada;
      _kissakiType = random.kissakiType;
      _muneType = random.muneType;
      _hamonInfo = random.hamonInfo;
      _yakibaInfo = random.yakibaInfo;
      _boshiInfo = random.boshiInfo;
      _nakagoInfo = random.nakagoInfo;
      _yasurimeInfo = random.yasurimeInfo;
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

  AlertDialog _showLengthDialog(BuildContext context, String title, Length length) {
    // length can be null
    assert(context != null);
    assert(title != null);

    final key = GlobalKey<LengthWidgetState>();

    var form = LengthWidget(length: length, key: key);

    final AlertDialog dialog = AlertDialog(
      title: Text(title),
      contentPadding: EdgeInsets.zero,
      content: form,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          // Return the new value to the caller via the navigator stack
          onPressed: () {
            var data = key.currentState.getLength();

            print('New value: ${data}');

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
    final hadaWidget = MultiSelectFormField(
      key: Key('Hada-${_hada.toString()}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Hada',
      dataSource: Hada.values
          .map((e) => {'display': e.label, 'value': e.name})
          .toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _hada.values().map((e) => e.name).toList() ?? [],
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          // List<dynamic> -> List<String> -> List<Hada>
          _hada = HadaInfo(
              value.map((name) => Hada.valueOf(name)).toList());
        });
      },
    );

    final hamonWidget = MultiSelectFormField(
      key: Key('Hamon-${_hamonInfo.toString()}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Hamon',
      dataSource: HamonType.values
          .map((e) => {'display': e.label, 'value': e.name})
          .toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _hamonInfo.values().map((e) => e.name).toList(),
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          // List<dynamic> -> List<String> -> List<HamonType>
          _hamonInfo = HamonInfo(value.map((name) => Hada.valueOf(name)).toList());
        });
      },
    );

    final yakibaWidget = MultiSelectFormField(
      key: Key('Yakiba-${_yakibaInfo.toString()}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Yakiba',
      dataSource: Yakiba.values
          .map((e) => {'display': e.label, 'value': e.name})
          .toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _yakibaInfo.values().map((e) => e.name).toList(),
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          // List<dynamic> -> List<String> -> List<Yakiba>
          _yakibaInfo = YakibaInfo(value.map((name) => Yakiba.valueOf(name)).toList());
        });
      },
    );

    final boshiWidget = MultiSelectFormField(
      key: Key('Boshi-${_boshiInfo.toString()}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Boshi',
      dataSource: Boshi.values
          .map((e) => {'display': e.label, 'value': e.name})
          .toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _boshiInfo.values().map((e) => e.name).toList(),
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          // List<dynamic> -> List<String> -> List<Boshi>
          _boshiInfo = BoshiInfo(value.map((name) => Boshi.valueOf(name)).toList());
        });
      },
    );

    final nakagoWidget = MultiSelectFormField(
      key: Key('Nakago-${_nakagoInfo.toString()}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Nakago',
      dataSource: Nakago.values
          .map((e) => {'display': e.label, 'value': e.name})
          .toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _nakagoInfo.values().map((e) => e.name).toList(),
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          // List<dynamic> -> List<String> -> List<Nakago>
          _nakagoInfo = NakagoInfo(value.map((name) => Boshi.valueOf(name)).toList());
        });
      },
    );

    final yasurimeWidget = MultiSelectFormField(
      key: Key('Yasurime-${_yasurimeInfo.toString()}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Yasurime',
      dataSource: Yasurime.values
          .map((e) => {'display': e.label, 'value': e.name})
          .toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _yasurimeInfo.values().map((e) => e.name).toList(),
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          // List<dynamic> -> List<String> -> List<Yasurime>
          _yasurimeInfo = YasurimeInfo(value.map((name) => Yasurime.valueOf(name)).toList());
        });
      },
    );

    const sizedBoxSpace = SizedBox(height: 8);

    // Build a Form widget using the _formKey created above.
    final form = Form(
        key: _formKey,
        child: Column(children: <Widget>[
          // ============ //
          // === Type === //
          // ============ //

          DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Type', border: OutlineInputBorder()),
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

          sizedBoxSpace,

          DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Geometry', border: OutlineInputBorder()),
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

          sizedBoxSpace,

          TextFormField(
            decoration: InputDecoration(labelText: 'Signature (romaji)', border: OutlineInputBorder()),
            initialValue: _signature.romaji,
            key: Key(
                'Signature-Romaji-${_signature.romaji}'), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
            onChanged: (value) {
              setState(() {
                _signature = _signature.copyWith(romaji: value);
              });

              _formKey.currentState.validate();
            },
          ),

          sizedBoxSpace,

          TextFormField(
            decoration: InputDecoration(labelText: 'Signature (kanji)', border: OutlineInputBorder()),
            initialValue: _signature.kanji,
            key: Key(
                'Signature-Kanji-${_signature.kanji}'), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
            onChanged: (value) {
              setState(() {
                _signature = _signature.copyWith(kanji: value);
              });

              _formKey.currentState.validate();
            },
          ),

          sizedBoxSpace,

          SwitchListTile(
              title: Text('Mumei'),
              value: _signature.mumei,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(() {
                  _signature = _signature.copyWith(mumei: value);
                });
              }),

          sizedBoxSpace,

          SwitchListTile(
              title: Text('Gimei'),
              value: _signature.gimei,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(() {
                  _signature = _signature.copyWith(gimei: value);
                });
              }),

          sizedBoxSpace,

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

          sizedBoxSpace,

          TextFormField(
            decoration: InputDecoration(labelText: 'Price', border: OutlineInputBorder()),
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

          sizedBoxSpace,

          TextFormField(
            decoration: InputDecoration(labelText: 'Nagasa', border: OutlineInputBorder()),
            readOnly: true,
            initialValue: "${_nagasa?.toText() ?? ''}",
            key: Key(
                'Nagasa-${_nagasa?.toText()}'), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _showLengthDialog(context, 'Set the nagasa', _nagasa);
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

          // ==================== //
          // === Total length === //
          // ==================== //

          sizedBoxSpace,

          TextFormField(
            decoration: InputDecoration(labelText: 'Total length', border: OutlineInputBorder()),
            readOnly: true,
            initialValue: "${_totalLength?.toText() ?? ''}",
            key: Key(
                'TotalLength-${_totalLength?.toText()}'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _showLengthDialog(context, 'Set the total length', _totalLength);
                  }).then((value) {
                if (value != null) {
                  setState(() {
                    _totalLength = value;

                    print("Total length set to ${value}");
                  });
                } else {
                  // The value is null if the user clicked "Cancel"
                }
              });
            },
          ),

          // ============== //
          // === Kasane === //
          // ============== //

          sizedBoxSpace,

          TextFormField(
            decoration: InputDecoration(labelText: 'Kasane', border: OutlineInputBorder()),
            readOnly: true,
            initialValue: "${_kasane?.toText() ?? ''}",
            key: Key(
                'Kasane-${_kasane?.toText()}'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _showLengthDialog(context, 'Set the kasane', _kasane);
                  }).then((value) {
                if (value != null) {
                  setState(() {
                    _kasane = value;

                    print("Kasane set to ${value}");
                  });
                } else {
                  // The value is null if the user clicked "Cancel"
                }
              });
            },
          ),

          // ================== //
          // === Motokasane === //
          // ================== //

          sizedBoxSpace,

          TextFormField(
            decoration: InputDecoration(labelText: 'Motokasane', border: OutlineInputBorder()),
            readOnly: true,
            initialValue: "${_motokasane?.toText() ?? ''}",
            key: Key(
                'Motokasane-${_motokasane?.toText()}'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _showLengthDialog(context, 'Set the motokasane', _motokasane);
                  }).then((value) {
                if (value != null) {
                  setState(() {
                    _motokasane = value;

                    print("Motokasane set to ${value}");
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

          sizedBoxSpace,

          TextFormField(
            decoration: InputDecoration(labelText: 'Sori', border: OutlineInputBorder()),
            readOnly: true,
            initialValue: "${_sori?.sori?.toText() ?? ''}",
            key: Key(
                'Sori-${_sori?.sori?.toText()}'), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _showLengthDialog(context, 'Set the sori', _sori.sori);
                  }).then((value) {
                if (value != null) {
                  setState(() {
                    // Update the sori based on the value returned by the dialog
                    _sori = _sori.copyWith(sori: value);

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

          sizedBoxSpace,

          DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Sori type', border: OutlineInputBorder()),
              value: _sori.type,
              items: Utils.getSoriTypeMenuItems(),
              onChanged: (value) {
                setState(() {
                  _sori = _sori.copyWith(type: value);
                });
              }),

          // ==================== //
          // === Kissaki Type === //
          // ==================== //

          sizedBoxSpace,

          DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Kissaki', border: OutlineInputBorder()),
              value: _kissakiType,
              items: Utils.getKissakiTypeMenuItems(),
              onChanged: (value) {
                setState(() {
                  _kissakiType = value;
                });
              }),

          // ================= //
          // === Mune Type === //
          // ================= //

          sizedBoxSpace,

          DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Mune', border: OutlineInputBorder()),
              value: _muneType,
              items: Utils.getMuneTypeMenuItems(),
              onChanged: (value) {
                setState(() {
                  _muneType = value;
                });
              }),

          // ============ //
          // === Hada === //
          // ============ //

          sizedBoxSpace,
          hadaWidget,

          // ============= //
          // === Hamon === //
          // ============= //

          sizedBoxSpace,
          hamonWidget,

          sizedBoxSpace,
          yakibaWidget,

          sizedBoxSpace,
          boshiWidget,

          sizedBoxSpace,
          nakagoWidget,

          sizedBoxSpace,
          yasurimeWidget,

          // =============== //
          // === Buttons === //
          // =============== //

          ButtonBar(children: [
//            ElevatedButton(child: Text('Reset'), onPressed: _reset),
            ElevatedButton(child: Text('Randomize'), onPressed: _randomize),
            ElevatedButton(child: Text('Save'), onPressed: _save)
          ])
        ])).pad();

    // Wrap the form into a list view to support scrolling
    return ListView(children: [form]);
  }
}
