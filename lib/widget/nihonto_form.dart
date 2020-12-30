import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nihonto_collection_manager/extensions.dart';
import 'package:nihonto_collection_manager/model/bohi.dart';
import 'package:nihonto_collection_manager/model/bohi_info.dart';
import 'package:nihonto_collection_manager/model/boshi.dart';
import 'package:nihonto_collection_manager/model/boshi_info.dart';
import 'package:nihonto_collection_manager/model/currency.dart';
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
import 'package:nihonto_collection_manager/model/polish.dart';
import 'package:nihonto_collection_manager/model/signature.dart';
import 'package:nihonto_collection_manager/model/signature_info.dart';
import 'package:nihonto_collection_manager/model/signature_type.dart';
import 'package:nihonto_collection_manager/model/sori_info.dart';
import 'package:nihonto_collection_manager/model/sori_type.dart';
import 'package:nihonto_collection_manager/model/sugata.dart';
import 'package:nihonto_collection_manager/model/weight.dart';
import 'package:nihonto_collection_manager/model/yakiba.dart';
import 'package:nihonto_collection_manager/model/yakiba_info.dart';
import 'package:nihonto_collection_manager/model/yasurime.dart';
import 'package:nihonto_collection_manager/model/yasurime_info.dart';
import 'package:nihonto_collection_manager/utils.dart';
import 'package:nihonto_collection_manager/widget/field_decoration.dart';
import 'package:nihonto_collection_manager/widget/length_widget.dart';
import 'package:nihonto_collection_manager/widget/money_widget.dart';
import 'package:nihonto_collection_manager/widget/multiselect_formfield.dart';
import 'package:nihonto_collection_manager/widget/weight_widget.dart';

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

  static const TextStyle _BOLD = TextStyle(fontWeight: FontWeight.bold);

  String _overallDescription;

  NihontoType _type;

  Sugata _sugata;

  String _sugataOther;

  Signature _signature = Signature.EMPTY;

  SignatureInfo _signatureInfo = SignatureInfo();

  Money _price = Money(0, Currency.USD);

  Length _nagasa,
      _totalLength,
      _kasane,
      _motokasane,
      _sakikasane,
      _mihaba,
      _motohaba,
      _sakihaba;

  Weight _weight;

  SoriInfo _sori = SoriInfo();

  HadaInfo _hada = HadaInfo();

  KissakiType _kissakiType;

  MuneType _muneType;

  HamonInfo _hamonInfo = HamonInfo();

  YakibaInfo _yakibaInfo = YakibaInfo();

  BoshiInfo _boshiInfo = BoshiInfo();

  NakagoInfo _nakagoInfo = NakagoInfo();

  YasurimeInfo _yasurimeInfo = YasurimeInfo();

  BohiInfo _bohiInfo = BohiInfo();

  Polish _polish;

  NihontoFormState(Nihonto nihonto) {
    // The argument can be null
    if (nihonto != null) {
      _overallDescription = nihonto.overallDescription;
      _type = nihonto.type;
      _sugata = nihonto.sugata;
      _sugataOther = nihonto.sugataOther;
      _signature = nihonto.signature;
      _signatureInfo = nihonto.signatureInfo;
      _price = nihonto.price;
      _nagasa = nihonto.nagasa;
      _totalLength = nihonto.totalLength;
      _kasane = nihonto.kasane;
      _motokasane = nihonto.motokasane;
      _sakikasane = nihonto.sakikasane;
      _mihaba = nihonto.mihaba;
      _motohaba = nihonto.motohaba;
      _sakihaba = nihonto.sakihaba;
      _weight = nihonto.weight;
      _sori = nihonto.sori;
      _hada = nihonto.hada;
      _kissakiType = nihonto.kissakiType;
      _muneType = nihonto.muneType;
      _hamonInfo = nihonto.hamonInfo;
      _yakibaInfo = nihonto.yakibaInfo;
      _boshiInfo = nihonto.boshiInfo;
      _nakagoInfo = nihonto.nakagoInfo;
      _yasurimeInfo = nihonto.yasurimeInfo;
      _bohiInfo = nihonto.bohiInfo;
      _polish = nihonto.polish;
    }
  }

  Nihonto _createNihonto() {
    return Nihonto(
        overallDescription: _overallDescription,
        type: _type,
        sugata: _sugata,
        sugataOther: _sugataOther,
        signature: _signature,
        signatureInfo: _signatureInfo,
        price: _price,
        nagasa: _nagasa,
        totalLength: _totalLength,
        kasane: _kasane,
        motokasane: _motokasane,
        sakikasane: _sakikasane,
        mihaba: _mihaba,
        motohaba: _motohaba,
        sakihaba: _sakihaba,
        weight: _weight,
        sori: _sori,
        hada: _hada,
        kissakiType: _kissakiType,
        muneType: _muneType,
        hamonInfo: _hamonInfo,
        yakibaInfo: _yakibaInfo,
        boshiInfo: _boshiInfo,
        nakagoInfo: _nakagoInfo,
        yasurimeInfo: _yasurimeInfo,
        bohiInfo: _bohiInfo,
        polish: _polish);
  }

  void _reset() {
    setState(() {
      _overallDescription = '';
      _signature = Signature.EMPTY;
      _signatureInfo = SignatureInfo();
      _type = null;
      _sugata = null;
      _sugataOther = '';
      _price = Money.ZERO;
      _nagasa = null;
      _totalLength = null;
      _kasane = null;
      _motokasane = null;
      _sakikasane = null;
      _mihaba = null;
      _motohaba = null;
      _sakihaba = null;
      _weight = null;
      _sori = SoriInfo();
      _hada = HadaInfo();
      _kissakiType = null;
      _muneType = null;
      _hamonInfo = HamonInfo();
      _yakibaInfo = YakibaInfo();
      _boshiInfo = BoshiInfo();
      _nakagoInfo = NakagoInfo();
      _yasurimeInfo = YasurimeInfo();
      _bohiInfo = BohiInfo();
      _polish = null;
    });
  }

  void _randomize() {
    setState(() {
      var random = Nihonto.random();

      _overallDescription = random.overallDescription;
      _signature = random.signature;
      _signatureInfo = random.signatureInfo;
      _sugata = random.sugata;
      _sugataOther = random.sugataOther;
      _type = random.type;
      _price = random.price;
      _nagasa = random.nagasa;
      _totalLength = random.totalLength;
      _kasane = random.kasane;
      _motokasane = random.motokasane;
      _sakikasane = random.sakikasane;
      _mihaba = random.mihaba;
      _motohaba = random.motohaba;
      _sakihaba = random.sakihaba;
      _weight = random.weight;
      _sori = random.sori;
      _hada = random.hada;
      _kissakiType = random.kissakiType;
      _muneType = random.muneType;
      _hamonInfo = random.hamonInfo;
      _yakibaInfo = random.yakibaInfo;
      _boshiInfo = random.boshiInfo;
      _nakagoInfo = random.nakagoInfo;
      _yasurimeInfo = random.yasurimeInfo;
      _bohiInfo = random.bohiInfo;
      _polish = random.polish;
    });
  }

  void _save() {
    // Validate returns true if the form is valid, otherwise false.
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

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
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('CANCEL'),
        ),
        TextButton(
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

  AlertDialog _showLengthDialog(
      BuildContext context, String title, Length length) {
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
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('CANCEL'),
        ),
        TextButton(
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

  AlertDialog _showWeightDialog(
      BuildContext context, String title, Weight weight) {

    // weight can be null
    assert(context != null);
    assert(title != null);

    final key = GlobalKey<WeightWidgetState>();

    var form = WeightWidget(weight: weight, key: key);

    final AlertDialog dialog = AlertDialog(
      title: Text(title),
      contentPadding: EdgeInsets.zero,
      content: form,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('CANCEL'),
        ),
        TextButton(
          // Return the new value to the caller via the navigator stack
          onPressed: () {
            var data = key.currentState.getWeight();

            print('New weight: ${data}');

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
      dataSource:
          Hada.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _hada.values(),
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          _hada = HadaInfo(value);
        });
      },
    );

    final hamonWidget = MultiSelectFormField(
      key: Key('Hamon-${_hamonInfo.toString()}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Hamon',
      dataSource: HamonType.values
          .map((e) => {'display': e.label, 'value': e})
          .toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _hamonInfo.values(),
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          _hamonInfo = HamonInfo(value);
        });
      },
    );

    final yakibaWidget = MultiSelectFormField(
      key: Key('Yakiba-${_yakibaInfo.toString()}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Yakiba',
      dataSource:
          Yakiba.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _yakibaInfo.values(),
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          _yakibaInfo = YakibaInfo(value);
        });
      },
    );

    final boshiWidget = MultiSelectFormField(
      key: Key('Boshi-${_boshiInfo.toString()}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Boshi',
      dataSource:
          Boshi.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _boshiInfo.values(),
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          _boshiInfo = BoshiInfo(value);
        });
      },
    );

    final nakagoWidget = MultiSelectFormField(
      key: Key('Nakago-${_nakagoInfo.toString()}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Nakago',
      dataSource:
          Nakago.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _nakagoInfo.values(),
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          _nakagoInfo = NakagoInfo(value);
        });
      },
    );

    final yasurimeWidget = MultiSelectFormField(
      key: Key('Yasurime-${_yasurimeInfo.toString()}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Yasurime',
      dataSource:
          Yasurime.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _yasurimeInfo.values(),
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          _yasurimeInfo = YasurimeInfo(value);
        });
      },
    );

    final bohiWidget = MultiSelectFormField(
      key: Key('Bohi-${_hada.toString()}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Bohi',
      dataSource:
          Bohi.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _bohiInfo.values(),
      onSaved: (value) {
        print('Bohi=${value}');

        setState(() {
          _bohiInfo = BohiInfo(value);
        });
      },
    );

    final signatureWidget = MultiSelectFormField(
      key: Key('SignatureInfo-${_signatureInfo.toString()}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Signature features',
      dataSource:
      SignatureType.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _signatureInfo.values(),
      onSaved: (value) {
        print('SignatureInfo=${value}');

        setState(() {
          _signatureInfo = SignatureInfo(value);
        });
      },
    );

    const sizedBoxSpace = SizedBox(height: 8);

    const rowPadder = SizedBox(width: 8);

    // Build a Form widget using the _formKey created above.
    final form = Form(
        key: _formKey,
        child: Column(children: <Widget>[

          // =========================== //
          // === Overall description === //
          // =========================== //

          TextFormField(
            decoration: FieldDecoration('Overall description'),
            initialValue: _overallDescription ?? '',
            minLines: 1,
            maxLines: 25,
            key: Key('Overall-Description-${_overallDescription}'),
            onChanged: (value) {
              setState(() {
                _overallDescription = value;
              });
            },
          ),

          sizedBoxSpace,

          // ============ //
          // === Type === //
          // ============ //

          DropdownButtonFormField(
              decoration: FieldDecoration('Type'),
              value: _type,
              items: Utils.getDropDownMenuItems(NihontoType.values),
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

          // ============== //
          // === Sugata === //
          // ============== //

          sizedBoxSpace, Divider(), sizedBoxSpace,

          DropdownButtonFormField(
              decoration: FieldDecoration('Sugata'),
              value: _sugata,
              items: Utils.getDropDownMenuItems(Sugata.values),
              onChanged: (value) {
                setState(() {
                  _sugata = value;
                });
              }),

          sizedBoxSpace,

          TextFormField(
            decoration: FieldDecoration('Sugata (other)'),
            initialValue: _sugataOther ?? '',
            minLines: 1,
            maxLines: 25,
            key: Key('Sugata-Other-${_sugataOther}'),
            onChanged: (value) {
              setState(() {
                _sugataOther = value;
              });
            },
          ),

          // ================= //
          // === Signature === //
          // ================= //

          sizedBoxSpace, Divider(), sizedBoxSpace,

          TextFormField(
            decoration: FieldDecoration('Signature (romaji)'),
            initialValue: _signature.romaji,
            key: Key('Signature-Romaji-${_signature.romaji}'),
            minLines: 1,
            maxLines: 25,
            onChanged: (value) {
              setState(() {
                _signature = _signature.copyWith(romaji: value);
              });
            },
          ),

          sizedBoxSpace,

          TextFormField(
            decoration: FieldDecoration('Signature (kanji)'),
            initialValue: _signature.kanji,
            key: Key('Signature-Kanji-${_signature.kanji}'),
            minLines: 1,
            maxLines: 25,
            onChanged: (value) {
              setState(() {
                _signature = _signature.copyWith(kanji: value);
              });
            },
          ),

          sizedBoxSpace,

          signatureWidget,

          sizedBoxSpace, Divider(), sizedBoxSpace,

          Row(children: [
            Expanded(child: TextFormField(
              decoration: FieldDecoration('Price'),
              readOnly: true,
              initialValue: "${_price.toText()}",
              textAlign: TextAlign.end,
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
            ),),
            rowPadder,
            Expanded(child: TextFormField(
              decoration: FieldDecoration('Weight'),
              readOnly: true,
              initialValue: "${_weight?.toText() ?? ''}",
              textAlign: TextAlign.end,
              key: Key(
                  'Weight-${_weight?.toText()}'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return _showWeightDialog(
                          context, 'Set the weight', _weight);
                    }).then((value) {
                  if (value != null) {
                    setState(() {
                      _weight = value;

                      print("Weight set to ${value}");
                    });
                  } else {
                    // The value is null if the user clicked "Cancel"
                  }
                });
              },
            ))
          ],
          ),

          sizedBoxSpace,

          Row(
            children: [
              Expanded(
                  child:

                      TextFormField(
                decoration: FieldDecoration('Nagasa'),
                readOnly: true,
                initialValue: "${_nagasa?.toText() ?? ''}",
                textAlign: TextAlign.end,
                key: Key(
                    'Nagasa-${_nagasa?.toText()}'), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return _showLengthDialog(
                            context, 'Set the nagasa', _nagasa);
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
              )),
              rowPadder,
              Expanded(
                  child:
                      TextFormField(
                decoration: FieldDecoration('Total length'),
                readOnly: true,
                initialValue: "${_totalLength?.toText() ?? ''}",
                textAlign: TextAlign.end,
                key: Key('TotalLength-${_totalLength?.toText()}'),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return _showLengthDialog(
                            context, 'Set the total length', _totalLength);
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
              ))
            ],
          ),

          sizedBoxSpace,

          Row(children: [

            Expanded(
                child: TextFormField(
              decoration: FieldDecoration('Kasane'),
              readOnly: true,
              initialValue: "${_kasane?.toText() ?? ''}",
              textAlign: TextAlign.end,
              key: Key('Kasane-${_kasane?.toText()}'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return _showLengthDialog(
                          context, 'Set the kasane', _kasane);
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
            )),

            rowPadder,

            Expanded(
                child: TextFormField(
              decoration: FieldDecoration('Motokasane'),
              readOnly: true,
              initialValue: "${_motokasane?.toText() ?? ''}",
              textAlign: TextAlign.end,
              key: Key('Motokasane-${_motokasane?.toText()}'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return _showLengthDialog(
                          context, 'Set the motokasane', _motokasane);
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
            )),

            rowPadder,

            Expanded(
                child: TextFormField(
              decoration: FieldDecoration('Sakikasane'),
              readOnly: true,
              initialValue: "${_sakikasane?.toText() ?? ''}",
              textAlign: TextAlign.end,
              key: Key('Sakikasane-${_sakikasane?.toText()}'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return _showLengthDialog(
                          context, 'Set the sakikasane', _sakikasane);
                    }).then((value) {
                  if (value != null) {
                    setState(() {
                      _sakikasane = value;

                      print("Sakikasane set to ${value}");
                    });
                  } else {
                    // The value is null if the user clicked "Cancel"
                  }
                });
              },
            )),
          ]),

          sizedBoxSpace,

          Row(children: [
            Expanded(
              child:

              // ================ //
              // === Motohaba === //
              // ================ //

              TextFormField(
                decoration: FieldDecoration('Mihaba'),
                readOnly: true,
                initialValue: "${_mihaba?.toText() ?? ''}",
                textAlign: TextAlign.end,
                key: Key('Mihaba-${_mihaba?.toText()}'),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return _showLengthDialog(
                            context, 'Set the mihaba', _mihaba);
                      }).then((value) {
                    if (value != null) {
                      setState(() {
                        _mihaba = value;

                        print("Mihaba set to ${value}");
                      });
                    } else {
                      // The value is null if the user clicked "Cancel"
                    }
                  });
                },
              ),
            ),
            rowPadder,
            Expanded(
              child:

                  // ================ //
                  // === Motohaba === //
                  // ================ //

                  TextFormField(
                decoration: FieldDecoration('Motohaba'),
                readOnly: true,
                initialValue: "${_motohaba?.toText() ?? ''}",
                textAlign: TextAlign.end,
                key: Key('Motohaba-${_motohaba?.toText()}'),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return _showLengthDialog(
                            context, 'Set the motohaba', _motohaba);
                      }).then((value) {
                    if (value != null) {
                      setState(() {
                        _motohaba = value;

                        print("Motohaba set to ${value}");
                      });
                    } else {
                      // The value is null if the user clicked "Cancel"
                    }
                  });
                },
              ),
            ),
            rowPadder,
            Expanded(
                child:

                    TextFormField(
              decoration: FieldDecoration('Sakihaba'),
              readOnly: true,
              initialValue: "${_sakihaba?.toText() ?? ''}",
              textAlign: TextAlign.end,
              key: Key('Sakihaba-${_sakihaba?.toText()}'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return _showLengthDialog(
                          context, 'Set the sakihaba', _sakihaba);
                    }).then((value) {
                  if (value != null) {
                    setState(() {
                      _sakihaba = value;

                      print("Sakihaba set to ${value}");
                    });
                  } else {
                    // The value is null if the user clicked "Cancel"
                  }
                });
              },
            ))
          ]),

          sizedBoxSpace,

          Row(
            children: [
              Expanded(
                  child: TextFormField(
                decoration: FieldDecoration('Sori'),
                readOnly: true,
                initialValue: "${_sori?.sori?.toText() ?? ''}",
                textAlign: TextAlign.end,
                key: Key(
                    'Sori-${_sori?.sori?.toText()}'), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return _showLengthDialog(
                            context, 'Set the sori', _sori.sori);
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
              )),
              rowPadder,
              Expanded(
                  child: DropdownButtonFormField(
                      decoration: FieldDecoration('Sori type'),
                      value: _sori.type,
                      items: Utils.getDropDownMenuItems(SoriType.values),
                      onChanged: (value) {
                        setState(() {
                          _sori = _sori.copyWith(type: value);
                        });
                      }))
            ],
          ),

          // ==================== //
          // === Kissaki Type === //
          // ==================== //

          sizedBoxSpace,

          DropdownButtonFormField(
              decoration: FieldDecoration('Kissaki'),
              value: _kissakiType,
              items: Utils.getDropDownMenuItems(KissakiType.values),
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
              decoration: FieldDecoration('Mune'),
              value: _muneType,
              items: Utils.getDropDownMenuItems(MuneType.values),
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

          sizedBoxSpace,
          bohiWidget,

          // ============== //
          // === Polish === //
          // ============== //

          sizedBoxSpace,

          DropdownButtonFormField(
              decoration: FieldDecoration('Polish'),
              value: _polish,
              items: Utils.getDropDownMenuItems(Polish.values),
              onChanged: (value) {
                setState(() {
                  _polish = value;
                });
              }),
        ])).pad();

    return Scaffold(
      appBar: AppBar(
        title: Text('Nihonto information'),
        actions: [
          TextButton(child: Icon(Icons.report_problem_outlined, color: Colors.white), onPressed: _randomize),
          TextButton(child: Icon(Icons.save, color: Colors.white), onPressed: _save)
        ]
      ),
      body: ListView(children: [form]) // Wrap the form into a list view to support scrolling
    );
  }
}
