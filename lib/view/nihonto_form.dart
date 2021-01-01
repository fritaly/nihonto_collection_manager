import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/bohi.dart';
import 'package:nihonto_collection_manager/model/bohi_info.dart';
import 'package:nihonto_collection_manager/model/boshi.dart';
import 'package:nihonto_collection_manager/model/boshi_info.dart';
import 'package:nihonto_collection_manager/model/currency.dart';
import 'package:nihonto_collection_manager/model/hada_type.dart';
import 'package:nihonto_collection_manager/model/hada_info.dart';
import 'package:nihonto_collection_manager/model/hamon_info.dart';
import 'package:nihonto_collection_manager/model/hamon_type.dart';
import 'package:nihonto_collection_manager/model/kissaki_info.dart';
import 'package:nihonto_collection_manager/model/kissaki_type.dart';
import 'package:nihonto_collection_manager/model/length.dart';
import 'package:nihonto_collection_manager/model/measurements.dart';
import 'package:nihonto_collection_manager/model/money.dart';
import 'package:nihonto_collection_manager/model/mune_info.dart';
import 'package:nihonto_collection_manager/model/mune_type.dart';
import 'package:nihonto_collection_manager/model/nakago.dart';
import 'package:nihonto_collection_manager/model/nakago_info.dart';
import 'package:nihonto_collection_manager/model/nihonto.dart';
import 'package:nihonto_collection_manager/model/nihonto_type.dart';
import 'package:nihonto_collection_manager/model/period.dart';
import 'package:nihonto_collection_manager/model/polish_info.dart';
import 'package:nihonto_collection_manager/model/polish_type.dart';
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

  SignatureInfo _signatureInfo = SignatureInfo.DEFAULT;

  Money _price = Money(0, Currency.USD);

  Measurements _measurements = Measurements.DEFAULT;

  Weight _weight;

  SoriInfo _soriInfo = SoriInfo.DEFAULT;

  HadaInfo _hadaInfo = HadaInfo.DEFAULT;

  KissakiInfo _kissakiInfo = KissakiInfo.DEFAULT;

  MuneInfo _muneInfo = MuneInfo.DEFAULT;

  HamonInfo _hamonInfo = HamonInfo.DEFAULT;

  YakibaInfo _yakibaInfo = YakibaInfo.DEFAULT;

  BoshiInfo _boshiInfo = BoshiInfo.DEFAULT;

  NakagoInfo _nakagoInfo = NakagoInfo.DEFAULT;

  YasurimeInfo _yasurimeInfo = YasurimeInfo.DEFAULT;

  BohiInfo _bohiInfo = BohiInfo.DEFAULT;

  PolishInfo _polishInfo = PolishInfo.DEFAULT;

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
    _sugataInfo = nihonto.sugata;
    _signatureInfo = nihonto.signature;
    _price = nihonto.price;
    _measurements = nihonto.measurements;
    _weight = nihonto.weight;
    _soriInfo = nihonto.sori;
    _hadaInfo = nihonto.hada;
    _kissakiInfo = nihonto.kissaki;
    _muneInfo = nihonto.mune;
    _hamonInfo = nihonto.hamon;
    _yakibaInfo = nihonto.yakiba;
    _boshiInfo = nihonto.boshi;
    _nakagoInfo = nihonto.nakago;
    _yasurimeInfo = nihonto.yasurime;
    _bohiInfo = nihonto.bohi;
    _polishInfo = nihonto.polish;
    _period = nihonto.period;
  }

  Nihonto _createNihonto() {
    return Nihonto(
        overallDescription: _overallDescription,
        type: _type,
        sugata: _sugataInfo,
        signature: _signatureInfo,
        price: _price,
        measurements: _measurements,
        weight: _weight,
        sori: _soriInfo,
        hada: _hadaInfo,
        kissaki: _kissakiInfo,
        mune: _muneInfo,
        hamon: _hamonInfo,
        yakiba: _yakibaInfo,
        boshi: _boshiInfo,
        nakago: _nakagoInfo,
        yasurime: _yasurimeInfo,
        bohi: _bohiInfo,
        polish: _polishInfo,
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
      key: Key('Hada-${_hadaInfo.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          HadaType.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _hadaInfo.types.values(),
      onSaved: (value) {
        setState(() {
          _hadaInfo = _hadaInfo.copyWith(types: EnumSet.from(value.cast<HadaType>()));
        });
      },
    );

    final hamonWidget = MultiSelectFormField(
      key: Key('Hamon-${_hamonInfo.types}'),
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
      initialValue: _hamonInfo.types.values(),
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          _hamonInfo = _hamonInfo.copyWith(types: EnumSet.from(value.cast<HamonType>()));
        });
      },
    );

    final yakibaWidget = MultiSelectFormField(
      key: Key('Yakiba-${_yakibaInfo.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          Yakiba.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _yakibaInfo.types.values(),
      onSaved: (value) {
        setState(() {
          _yakibaInfo = _yakibaInfo.copyWith(types: EnumSet.from(value.cast<Yakiba>()));
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
      initialValue: _boshiInfo.types.values(),
      onSaved: (value) {
        setState(() {
          _boshiInfo = _boshiInfo.copyWith(types: EnumSet.from(value.cast<Boshi>()));
        });
      },
    );

    final nakagoWidget = MultiSelectFormField(
      key: Key('Nakago-${_nakagoInfo.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          Nakago.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _nakagoInfo.types.values(),
      onSaved: (value) {
        setState(() {
          _boshiInfo = _boshiInfo.copyWith(types: EnumSet.from(value.cast<Nakago>()));
        });
      },
    );

    final yasurimeWidget = MultiSelectFormField(
      key: Key('Yasurime-${_yasurimeInfo.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          Yasurime.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _yasurimeInfo.types.values(),
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          _yasurimeInfo = _yasurimeInfo.copyWith(types: EnumSet.from(value.cast<Yasurime>()));
        });
      },
    );

    final bohiWidget = MultiSelectFormField(
      key: Key('Bohi-${_bohiInfo.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          Bohi.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _bohiInfo.types.values(),
      onSaved: (value) {
        setState(() {
          _bohiInfo = _bohiInfo.copyWith(types: EnumSet.from(value.cast<Bohi>()));
        });
      },
    );

    final signatureWidget = MultiSelectFormField(
      key: Key('SignatureInfo-${_signatureInfo.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Features',
      dataSource:
      SignatureType.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _signatureInfo.types.values(),
      onSaved: (value) {
        setState(() {
          _signatureInfo = _signatureInfo.copyWith(types: EnumSet.from(value.cast<SignatureType>()));
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

          ExpansibleTile(text: 'Signature', initiallyExpanded: !_signatureInfo.isBlank(), children: [
            TextFormField(
              decoration: FieldDecoration('Romaji'),
              readOnly: readOnly,
              initialValue: _signatureInfo.romaji,
              key: Key('Signature-Romaji-${_signatureInfo.romaji}'),
              minLines: 1,
              maxLines: 25,
              onChanged: (value) {
                setState(() {
                  _signatureInfo = _signatureInfo.copyWith(romaji: value);
                });
              },
            ),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Kanji'),
              readOnly: readOnly,
              initialValue: _signatureInfo.kanji,
              key: Key('Signature-Kanji-${_signatureInfo.kanji}'),
              minLines: 1,
              maxLines: 25,
              onChanged: (value) {
                setState(() {
                  _signatureInfo = _signatureInfo.copyWith(kanji: value);
                });
              },
            ),

            columnPadder,

            signatureWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _signatureInfo.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Signature-Other-${_signatureInfo.other}'),
              onChanged: (value) {
                setState(() {
                  _signatureInfo = _signatureInfo.copyWith(other: value);
                });
              },
            ),
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

          ExpansibleTile(text: 'Sori', initiallyExpanded: !_soriInfo.isBlank(), children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                      decoration: FieldDecoration('Sori'),
                      readOnly: true,
                      initialValue: "${_soriInfo?.sori?.toText() ?? ''}",
                      textAlign: TextAlign.end,
                      key: Key('Sori-${_soriInfo?.sori?.toText()}'),
                      onTap: () {
                        if (readOnly) {
                          return;
                        }

                        showDialog(
                            context: context,
                            builder: (context) {
                              return _showLengthDialog(
                                  context, 'Set the sori', _soriInfo.sori);
                            }).then((value) {
                          if (value != null) {
                            setState(() {
                              // Update the sori based on the value returned by the dialog
                              _soriInfo = _soriInfo.copyWith(sori: value);

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
                        value: _soriInfo.type,
                        items: Utils.getDropDownMenuItems(SoriType.values),
                        onChanged: (value) {
                          setState(() {
                            _soriInfo = _soriInfo.copyWith(type: value);
                          });
                        }))
              ],
            ),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _soriInfo.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Sori-Other-${_soriInfo.other}'),
              onChanged: (value) {
                setState(() {
                  _soriInfo = _soriInfo.copyWith(other: value);
                });
              },
            ),
          ]),

          // =============== //
          // === Kissaki === //
          // =============== //

          ExpansibleTile(text: 'Kissaki', initiallyExpanded: !_kissakiInfo.isBlank(), children: [
            DropdownButtonFormField(
                decoration: FieldDecoration('Type'),
                value: _kissakiInfo.type,
                items: Utils.getDropDownMenuItems(KissakiType.values),
                onChanged: (value) {
                  setState(() {
                    _kissakiInfo = _kissakiInfo.copyWith(type: value);
                  });
                }),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _kissakiInfo.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Kissaki-Other-${_kissakiInfo.other}'),
              onChanged: (value) {
                setState(() {
                  _kissakiInfo = _kissakiInfo.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============ //
          // === Mune === //
          // ============ //

          ExpansibleTile(text: 'Mune', initiallyExpanded: !_muneInfo.isBlank(), children: [
            DropdownButtonFormField(
                decoration: FieldDecoration('Type'),
                value: _muneInfo.type,
                items: Utils.getDropDownMenuItems(MuneType.values),
                onChanged: (value) {
                  setState(() {
                    _muneInfo = _muneInfo.copyWith(type: value);
                  });
                }),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _muneInfo.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Mune-Other-${_muneInfo.other}'),
              onChanged: (value) {
                setState(() {
                  _muneInfo = _muneInfo.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============ //
          // === Hada === //
          // ============ //

          ExpansibleTile(text: 'Hada', initiallyExpanded: !_hadaInfo.isBlank(), children: [
            hadaWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _hadaInfo.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Hada-Other-${_hadaInfo.other}'),
              onChanged: (value) {
                setState(() {
                  _hadaInfo = _hadaInfo.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============= //
          // === Hamon === //
          // ============= //

          ExpansibleTile(text: 'Hamon', initiallyExpanded: !_hamonInfo.isBlank(), children: [
            hamonWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _hamonInfo.other ?? '',
              minLines: 1,
              maxLines: 25,
              key: Key('Hamon-Other-${_hamonInfo.other}'),
              onChanged: (value) {
                setState(() {
                  _hamonInfo = _hamonInfo.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============== //
          // === Yakiba === //
          // ============== //

          ExpansibleTile(text: 'Yakiba', initiallyExpanded: !_yakibaInfo.isBlank(), children: [
            yakibaWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _yakibaInfo.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Yakiba-Other-${_yakibaInfo.other}'),
              onChanged: (value) {
                setState(() {
                  _yakibaInfo = _yakibaInfo.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============ //
          // === Bohi === //
          // ============ //

          ExpansibleTile(text: 'Boshi', initiallyExpanded: !_boshiInfo.isBlank(), children: [
            boshiWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _boshiInfo.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Boshi-Other-${_boshiInfo.other}'),
              onChanged: (value) {
                setState(() {
                  _boshiInfo = _boshiInfo.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============== //
          // === Nakago === //
          // ============== //

          ExpansibleTile(text: 'Nakago', initiallyExpanded: !_nakagoInfo.isBlank(), children: [
            nakagoWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _nakagoInfo.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Nakago-Other-${_nakagoInfo.other}'),
              onChanged: (value) {
                setState(() {
                  _nakagoInfo = _nakagoInfo.copyWith(other: value);
                });
              },
            ),
          ]),

          // ================ //
          // === Yasurime === //
          // ================ //

          ExpansibleTile(text: 'Yasurime', initiallyExpanded: !_yasurimeInfo.isBlank(), children: [
            yasurimeWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _yasurimeInfo.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Yasurime-Other-${_yasurimeInfo.other}'),
              onChanged: (value) {
                setState(() {
                  _yasurimeInfo = _yasurimeInfo.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============ //
          // === Bohi === //
          // ============ //

          ExpansibleTile(text: 'Bohi', initiallyExpanded: !_bohiInfo.isBlank(), children: [
            bohiWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _bohiInfo.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Bohi-Other-${_bohiInfo.other}'),
              onChanged: (value) {
                setState(() {
                  _bohiInfo = _bohiInfo.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============== //
          // === Polish === //
          // ============== //

          ExpansibleTile(text: 'Polish', initiallyExpanded: !_polishInfo.isBlank(), children: [
            DropdownButtonFormField(
                decoration: FieldDecoration('Type'),
                value: _polishInfo.type,
                items: Utils.getDropDownMenuItems(PolishType.values),
                onChanged: (value) {
                  setState(() {
                    _polishInfo = _polishInfo.copyWith(type: value);
                  });
                }),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _polishInfo.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Polish-Other-${_polishInfo.other}'),
              onChanged: (value) {
                setState(() {
                  _polishInfo = _polishInfo.copyWith(other: value);
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
