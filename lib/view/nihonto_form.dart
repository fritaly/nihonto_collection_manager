import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:nihonto_collection_manager/model/measurements.dart';
import 'package:nihonto_collection_manager/model/money.dart';
import 'package:nihonto_collection_manager/model/mune_type.dart';
import 'package:nihonto_collection_manager/model/nakago.dart';
import 'package:nihonto_collection_manager/model/nakago_info.dart';
import 'package:nihonto_collection_manager/model/nihonto.dart';
import 'package:nihonto_collection_manager/model/nihonto_type.dart';
import 'package:nihonto_collection_manager/model/period.dart';
import 'package:nihonto_collection_manager/model/polish.dart';
import 'package:nihonto_collection_manager/model/signature.dart';
import 'package:nihonto_collection_manager/model/signature_info.dart';
import 'package:nihonto_collection_manager/model/signature_type.dart';
import 'package:nihonto_collection_manager/model/sori_info.dart';
import 'package:nihonto_collection_manager/model/sori_type.dart';
import 'package:nihonto_collection_manager/model/sugata.dart';
import 'package:nihonto_collection_manager/model/sugata_info.dart';
import 'package:nihonto_collection_manager/model/weight.dart';
import 'package:nihonto_collection_manager/model/yakiba.dart';
import 'package:nihonto_collection_manager/model/yakiba_info.dart';
import 'package:nihonto_collection_manager/model/yasurime.dart';
import 'package:nihonto_collection_manager/model/yasurime_info.dart';
import 'package:nihonto_collection_manager/utils.dart';
import 'package:nihonto_collection_manager/widget/expansible_tile.dart';
import 'package:nihonto_collection_manager/widget/field_decoration.dart';
import 'package:nihonto_collection_manager/widget/length_widget.dart';
import 'package:nihonto_collection_manager/widget/money_widget.dart';
import 'package:nihonto_collection_manager/widget/multiselect_formfield.dart';
import 'package:nihonto_collection_manager/widget/weight_widget.dart';

enum Mode {
  READ, WRITE
}

class NihontoForm extends StatefulWidget {
  static final TextInputFormatter decimalNumber =
      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'));

  Nihonto _nihonto;
  Mode _mode;

  NihontoForm(Mode mode, [Nihonto nihonto]) {
    _nihonto = nihonto;
    _mode = mode;
  }

  @override
  NihontoFormState createState() => NihontoFormState(_mode, _nihonto);
}

class NihontoFormState extends State<NihontoForm> {
  // Create a global key that uniquely identifies the Form widget and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`, not a GlobalKey<NihontoFormState>.
  final _formKey = GlobalKey<FormState>();

  Mode _mode;

  String _overallDescription;

  NihontoType _type;

  SugataInfo _sugataInfo = SugataInfo.DEFAULT;

  Signature _signature = Signature.EMPTY;

  SignatureInfo _signatureInfo = SignatureInfo();

  Money _price = Money(0, Currency.USD);

  Measurements _measurements = Measurements.DEFAULT;

  Weight _weight;

  SoriInfo _sori = SoriInfo();

  String _soriOther;

  HadaInfo _hada = HadaInfo();

  String _hadaOther;

  KissakiType _kissakiType;

  String _kissakiOther;

  MuneType _muneType;

  String _muneOther;

  HamonInfo _hamonInfo = HamonInfo();

  String _hamonOther;

  YakibaInfo _yakibaInfo = YakibaInfo();

  String _yakibaOther;

  BoshiInfo _boshiInfo = BoshiInfo();

  String _boshiOther;

  NakagoInfo _nakagoInfo = NakagoInfo();

  String _nakagoOther;

  YasurimeInfo _yasurimeInfo = YasurimeInfo();

  String _yasurimeOther;

  BohiInfo _bohiInfo = BohiInfo();

  String _bohiOther;

  Polish _polish;

  String _polishOther;

  Period _period;

  NihontoFormState(Mode mode, Nihonto nihonto) {
    assert (mode != null);

    this._mode = mode;

    // The argument can be null
    if (nihonto != null) {
      _setNihonto(nihonto);
    }
  }

  void _setNihonto(Nihonto nihonto) {
    assert (nihonto != null);

    _overallDescription = nihonto.overallDescription;
    _type = nihonto.type;
    _sugataInfo = nihonto.sugataInfo;
    _signature = nihonto.signature;
    _signatureInfo = nihonto.signatureInfo;
    _price = nihonto.price;
    _measurements = nihonto.measurements;
    _weight = nihonto.weight;
    _sori = nihonto.sori;
    _soriOther = nihonto.soriOther;
    _hada = nihonto.hada;
    _hadaOther = nihonto.hadaOther;
    _kissakiType = nihonto.kissakiType;
    _kissakiOther = nihonto.kissakiOther;
    _muneType = nihonto.muneType;
    _muneOther = nihonto.muneOther;
    _hamonInfo = nihonto.hamonInfo;
    _hamonOther = nihonto.hamonOther;
    _yakibaInfo = nihonto.yakibaInfo;
    _yakibaOther = nihonto.yakibaOther;
    _boshiInfo = nihonto.boshiInfo;
    _boshiOther = nihonto.boshiOther;
    _nakagoInfo = nihonto.nakagoInfo;
    _nakagoOther = nihonto.nakagoOther;
    _yasurimeInfo = nihonto.yasurimeInfo;
    _yasurimeOther = nihonto.yasurimeOther;
    _bohiInfo = nihonto.bohiInfo;
    _bohiOther = nihonto.bohiOther;
    _polish = nihonto.polish;
    _polishOther = nihonto.polishOther;
    _period = nihonto.period;
  }

  Nihonto _createNihonto() {
    return Nihonto(
        overallDescription: _overallDescription,
        type: _type,
        sugataInfo: _sugataInfo,
        signature: _signature,
        signatureInfo: _signatureInfo,
        price: _price,
        measurements: _measurements,
        weight: _weight,
        sori: _sori,
        soriOther: _soriOther,
        hada: _hada,
        hadaOther: _hadaOther,
        kissakiType: _kissakiType,
        kissakiOther: _kissakiOther,
        muneType: _muneType,
        muneOther: _muneOther,
        hamonInfo: _hamonInfo,
        hamonOther: _hamonOther,
        yakibaInfo: _yakibaInfo,
        yakibaOther: _yakibaOther,
        boshiInfo: _boshiInfo,
        boshiOther: _boshiOther,
        nakagoInfo: _nakagoInfo,
        nakagoOther: _nakagoOther,
        yasurimeInfo: _yasurimeInfo,
        yasurimeOther: _yasurimeOther,
        bohiInfo: _bohiInfo,
        bohiOther: _bohiOther,
        polish: _polish,
        polishOther: _polishOther,
        period: _period
    );
  }

  void _randomize() {
    setState(() {
      _setNihonto(Nihonto.random());
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
    final bool readOnly = (_mode == Mode.READ);

    final hadaWidget = MultiSelectFormField(
      key: Key('Hada-${_hada.toString()}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
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
      title: 'Type',
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
      title: 'Type',
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
      title: 'Type',
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
      title: 'Type',
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
      title: 'Type',
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
      title: 'Type',
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
      title: 'Features',
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

    const columnPadder = SizedBox(height: 8);

    const rowPadder = SizedBox(width: 8);

    // Build a Form widget using the _formKey created above.
    final form = Form(
        key: _formKey,
        child: Column(children: <Widget>[

          // =========================== //
          // === Overall description === //
          // =========================== //

          ExpansibleTile(text: 'General', initiallyExpanded: true,
            children: [
              TextFormField(
                decoration: FieldDecoration('Overall description'),
                readOnly: readOnly,
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

              columnPadder,

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
            ]),

          // ============== //
          // === Sugata === //
          // ============== //

          ExpansibleTile(text: 'Sugata', initiallyExpanded: !_sugataInfo.isBlank(),
            children: [
            DropdownButtonFormField(
                decoration: FieldDecoration('Type'),
                value: _sugataInfo.type,
                items: Utils.getDropDownMenuItems(Sugata.values),
                onChanged: (value) {
                  setState(() {
                    _sugataInfo = _sugataInfo.copyWith(type: value);
                  });
                }),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _sugataInfo.other ?? '',
              minLines: 1,
              maxLines: 25,
              key: Key('Sugata-Other-${_sugataInfo.other}'),
              onChanged: (value) {
                setState(() {
                  _sugataInfo = _sugataInfo.copyWith(other: value);
                });
              },
            ),
          ],),

          // ================= //
          // === Signature === //
          // ================= //

          ExpansibleTile(text: 'Signature', initiallyExpanded: !_signature.isBlank(), children: [
            TextFormField(
              decoration: FieldDecoration('Romaji'),
              readOnly: readOnly,
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

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Kanji'),
              readOnly: readOnly,
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

            columnPadder,

            signatureWidget,
          ]),

          ExpansibleTile(text: 'Miscellaneous', initiallyExpanded: readOnly, children: [
            Row(children: [
              Expanded(child: TextFormField(
                decoration: FieldDecoration('Price'),
                readOnly: true,
                initialValue: "${_price.toText()}",
                textAlign: TextAlign.end,
                key: Key('Price-${_price.toText()}'),
                onTap: () {
                  if (readOnly) {
                    return;
                  }

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
                key: Key('Weight-${_weight?.toText()}'),
                onTap: () {
                  if (readOnly) {
                    return;
                  }

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
          ]),

          ExpansibleTile(text: 'Dimensions', initiallyExpanded: !_measurements.isBlank(), children: [
            Row(
              children: [
                Expanded(
                    child:

                    TextFormField(
                      decoration: FieldDecoration('Nagasa'),
                      readOnly: true,
                      initialValue: "${_measurements.nagasa?.toText() ?? ''}",
                      textAlign: TextAlign.end,
                      key: Key(
                          'Nagasa-${_measurements.nagasa?.toText()}'),
                      onTap: () {
                        if (readOnly) {
                          return;
                        }

                        showDialog(
                            context: context,
                            builder: (context) {
                              return _showLengthDialog(
                                  context, 'Set the nagasa', _measurements.nagasa);
                            }).then((value) {
                          if (value != null) {
                            setState(() {
                              // Update the nagasa based on the value returned by the dialog
                              _measurements = _measurements.copyWith(nagasa: value);

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
                      initialValue: "${_measurements.totalLength?.toText() ?? ''}",
                      textAlign: TextAlign.end,
                      key: Key('TotalLength-${_measurements.totalLength?.toText()}'),
                      onTap: () {
                        if (readOnly) {
                          return;
                        }

                        showDialog(
                            context: context,
                            builder: (context) {
                              return _showLengthDialog(
                                  context, 'Set the total length', _measurements.totalLength);
                            }).then((value) {
                          if (value != null) {
                            setState(() {
                              _measurements = _measurements.copyWith(totalLength: value);

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

            columnPadder,

            Row(children: [

              Expanded(
                  child: TextFormField(
                    decoration: FieldDecoration('Kasane'),
                    readOnly: true,
                    initialValue: "${_measurements.kasane?.toText() ?? ''}",
                    textAlign: TextAlign.end,
                    key: Key('Kasane-${_measurements.kasane?.toText()}'),
                    onTap: () {
                      if (readOnly) {
                        return;
                      }

                      showDialog(
                          context: context,
                          builder: (context) {
                            return _showLengthDialog(
                                context, 'Set the kasane', _measurements.kasane);
                          }).then((value) {
                        if (value != null) {
                          setState(() {
                            _measurements = _measurements.copyWith(kasane: value);

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
                    initialValue: "${_measurements.motokasane?.toText() ?? ''}",
                    textAlign: TextAlign.end,
                    key: Key('Motokasane-${_measurements.motokasane?.toText()}'),
                    onTap: () {
                      if (readOnly) {
                        return;
                      }

                      showDialog(
                          context: context,
                          builder: (context) {
                            return _showLengthDialog(
                                context, 'Set the motokasane', _measurements.motokasane);
                          }).then((value) {
                        if (value != null) {
                          setState(() {
                            _measurements = _measurements.copyWith(motokasane: value);

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
                    initialValue: "${_measurements.sakikasane?.toText() ?? ''}",
                    textAlign: TextAlign.end,
                    key: Key('Sakikasane-${_measurements.sakikasane?.toText()}'),
                    onTap: () {
                      if (readOnly) {
                        return;
                      }

                      showDialog(
                          context: context,
                          builder: (context) {
                            return _showLengthDialog(
                                context, 'Set the sakikasane', _measurements.sakikasane);
                          }).then((value) {
                        if (value != null) {
                          setState(() {
                            _measurements = _measurements.copyWith(sakikasane: value);

                            print("Sakikasane set to ${value}");
                          });
                        } else {
                          // The value is null if the user clicked "Cancel"
                        }
                      });
                    },
                  )),
            ]),

            columnPadder,

            Row(children: [
              Expanded(
                child:

                // ================ //
                // === Motohaba === //
                // ================ //

                TextFormField(
                  decoration: FieldDecoration('Mihaba'),
                  readOnly: true,
                  initialValue: "${_measurements.mihaba?.toText() ?? ''}",
                  textAlign: TextAlign.end,
                  key: Key('Mihaba-${_measurements.mihaba?.toText()}'),
                  onTap: () {
                    if (readOnly) {
                      return;
                    }

                    showDialog(
                        context: context,
                        builder: (context) {
                          return _showLengthDialog(
                              context, 'Set the mihaba', _measurements.mihaba);
                        }).then((value) {
                      if (value != null) {
                        setState(() {
                          _measurements = _measurements.copyWith(mihaba: value);

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
                  initialValue: "${_measurements.motohaba?.toText() ?? ''}",
                  textAlign: TextAlign.end,
                  key: Key('Motohaba-${_measurements.motohaba?.toText()}'),
                  onTap: () {
                    if (readOnly) {
                      return;
                    }

                    showDialog(
                        context: context,
                        builder: (context) {
                          return _showLengthDialog(
                              context, 'Set the motohaba', _measurements.motohaba);
                        }).then((value) {
                      if (value != null) {
                        setState(() {
                          _measurements = _measurements.copyWith(motohaba: value);

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
                    initialValue: "${_measurements.sakihaba?.toText() ?? ''}",
                    textAlign: TextAlign.end,
                    key: Key('Sakihaba-${_measurements.sakihaba?.toText()}'),
                    onTap: () {
                      if (readOnly) {
                        return;
                      }

                      showDialog(
                          context: context,
                          builder: (context) {
                            return _showLengthDialog(
                                context, 'Set the sakihaba', _measurements.sakihaba);
                          }).then((value) {
                        if (value != null) {
                          setState(() {
                            _measurements = _measurements.copyWith(sakihaba: value);

                            print("Sakihaba set to ${value}");
                          });
                        } else {
                          // The value is null if the user clicked "Cancel"
                        }
                      });
                    },
                  ))
            ]),
          ]),

          // ============ //
          // === Sori === //
          // ============ //

          ExpansibleTile(text: 'Sori', initiallyExpanded: readOnly, children: [
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
                        if (readOnly) {
                          return;
                        }

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
                        decoration: FieldDecoration('Type'),
                        value: _sori.type,
                        items: Utils.getDropDownMenuItems(SoriType.values),
                        onChanged: (value) {
                          setState(() {
                            _sori = _sori.copyWith(type: value);
                          });
                        }))
              ],
            ),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _soriOther ?? '',
              minLines: 1,
              maxLines: 25,
              key: Key('Sori-Other-${_soriOther}'),
              onChanged: (value) {
                setState(() {
                  _soriOther = value;
                });
              },
            ),
          ]),

          // =============== //
          // === Kissaki === //
          // =============== //

          ExpansibleTile(text: 'Kissaki', initiallyExpanded: readOnly, children: [
            DropdownButtonFormField(
                decoration: FieldDecoration('Type'),
                value: _kissakiType,
                items: Utils.getDropDownMenuItems(KissakiType.values),
                onChanged: (value) {
                  setState(() {
                    _kissakiType = value;
                  });
                }),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _kissakiOther ?? '',
              minLines: 1,
              maxLines: 25,
              key: Key('Kissaki-Other-${_kissakiOther}'),
              onChanged: (value) {
                setState(() {
                  _kissakiOther = value;
                });
              },
            ),
          ]),

          // ============ //
          // === Mune === //
          // ============ //

          ExpansibleTile(text: 'Mune', initiallyExpanded: readOnly, children: [
            DropdownButtonFormField(
                decoration: FieldDecoration('Type'),
                value: _muneType,
                items: Utils.getDropDownMenuItems(MuneType.values),
                onChanged: (value) {
                  setState(() {
                    _muneType = value;
                  });
                }),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _muneOther ?? '',
              minLines: 1,
              maxLines: 25,
              key: Key('Mune-Other-${_muneOther}'),
              onChanged: (value) {
                setState(() {
                  _muneOther = value;
                });
              },
            ),
          ]),

          // ============ //
          // === Hada === //
          // ============ //

          ExpansibleTile(text: 'Hada', initiallyExpanded: readOnly, children: [
            hadaWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _hadaOther ?? '',
              minLines: 1,
              maxLines: 25,
              key: Key('Hada-Other-${_hadaOther}'),
              onChanged: (value) {
                setState(() {
                  _hadaOther = value;
                });
              },
            ),
          ]),

          // ============= //
          // === Hamon === //
          // ============= //

          ExpansibleTile(text: 'Hamon', initiallyExpanded: readOnly, children: [
            hamonWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _hamonOther ?? '',
              minLines: 1,
              maxLines: 25,
              key: Key('Hamon-Other-${_hamonOther}'),
              onChanged: (value) {
                setState(() {
                  _hamonOther = value;
                });
              },
            ),
          ]),

          // ============== //
          // === Yakiba === //
          // ============== //

          ExpansibleTile(text: 'Yakiba', initiallyExpanded: readOnly, children: [
            yakibaWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _yakibaOther ?? '',
              minLines: 1,
              maxLines: 25,
              key: Key('Yakiba-Other-${_yakibaOther}'),
              onChanged: (value) {
                setState(() {
                  _yakibaOther = value;
                });
              },
            ),
          ]),

          // ============ //
          // === Bohi === //
          // ============ //

          ExpansibleTile(text: 'Boshi', initiallyExpanded: readOnly, children: [
            boshiWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _boshiOther ?? '',
              minLines: 1,
              maxLines: 25,
              key: Key('Boshi-Other-${_boshiOther}'),
              onChanged: (value) {
                setState(() {
                  _boshiOther = value;
                });
              },
            ),
          ]),

          // ============== //
          // === Nakago === //
          // ============== //

          ExpansibleTile(text: 'Nakago', initiallyExpanded: readOnly, children: [
            nakagoWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _nakagoOther ?? '',
              minLines: 1,
              maxLines: 25,
              key: Key('Nakago-Other-${_nakagoOther}'),
              onChanged: (value) {
                setState(() {
                  _nakagoOther = value;
                });
              },
            ),
          ]),

          // ================ //
          // === Yasurime === //
          // ================ //

          ExpansibleTile(text: 'Yasurime', initiallyExpanded: readOnly, children: [
            yasurimeWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _yasurimeOther ?? '',
              minLines: 1,
              maxLines: 25,
              key: Key('Yasurime-Other-${_yasurimeOther}'),
              onChanged: (value) {
                setState(() {
                  _yasurimeOther = value;
                });
              },
            ),
          ]),

          // ============ //
          // === Bohi === //
          // ============ //

          ExpansibleTile(text: 'Bohi', initiallyExpanded: readOnly, children: [
            bohiWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _bohiOther ?? '',
              minLines: 1,
              maxLines: 25,
              key: Key('Bohi-Other-${_bohiOther}'),
              onChanged: (value) {
                setState(() {
                  _bohiOther = value;
                });
              },
            ),
          ]),

          // ============== //
          // === Polish === //
          // ============== //

          ExpansibleTile(text: 'Polish', initiallyExpanded: readOnly, children: [
            DropdownButtonFormField(
                decoration: FieldDecoration('Type'),
                value: _polish,
                items: Utils.getDropDownMenuItems(Polish.values),
                onChanged: (value) {
                  setState(() {
                    _polish = value;
                  });
                }),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _polishOther ?? '',
              minLines: 1,
              maxLines: 25,
              key: Key('Polish-Other-${_polishOther}'),
              onChanged: (value) {
                setState(() {
                  _polishOther = value;
                });
              },
            ),
          ]),

          // ============== //
          // === Period === //
          // ============== //

          ExpansibleTile(text: 'Period', initiallyExpanded: readOnly, children: [
            DropdownButtonFormField(
                decoration: FieldDecoration('Period'),
                value: _period,
                items: Utils.getDropDownMenuItems(Period.values),
                onChanged: (value) {
                  setState(() {
                    _period = value;
                  });
                }),
          ]),

        ]));

    var actions = <Widget>[];

    if (!readOnly) {
      // Only display the actions in not in read-only mode
      actions.add(TextButton(child: Icon(Icons.report_problem_outlined, color: Colors.white), onPressed: _randomize));
      actions.add(TextButton(child: Icon(Icons.save, color: Colors.white), onPressed: _save));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Nihonto information'),
        actions: actions
      ),
      body: ListView(children: [form]) // Wrap the form into a list view to support scrolling
    );
  }
}
