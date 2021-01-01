import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nihonto_collection_manager/enum.dart';
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

  SugataInfo _sugata = SugataInfo.DEFAULT;

  SignatureInfo _signature = SignatureInfo.DEFAULT;

  Money _price = Money(0, Currency.USD);

  Measurements _measurements = Measurements.DEFAULT;

  Weight _weight;

  SoriInfo _sori = SoriInfo.DEFAULT;

  HadaInfo _hada = HadaInfo.DEFAULT;

  KissakiInfo _kissaki = KissakiInfo.DEFAULT;

  MuneInfo _mune = MuneInfo.DEFAULT;

  HamonInfo _hamon = HamonInfo.DEFAULT;

  YakibaInfo _yakiba = YakibaInfo.DEFAULT;

  BoshiInfo _boshi = BoshiInfo.DEFAULT;

  NakagoInfo _nakago = NakagoInfo.DEFAULT;

  YasurimeInfo _yasurime = YasurimeInfo.DEFAULT;

  BohiInfo _bohi = BohiInfo.DEFAULT;

  PolishInfo _polish = PolishInfo.DEFAULT;

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
    _sugata = nihonto.sugata;
    _signature = nihonto.signature;
    _price = nihonto.price;
    _measurements = nihonto.measurements;
    _weight = nihonto.weight;
    _sori = nihonto.sori;
    _hada = nihonto.hada;
    _kissaki = nihonto.kissaki;
    _mune = nihonto.mune;
    _hamon = nihonto.hamon;
    _yakiba = nihonto.yakiba;
    _boshi = nihonto.boshi;
    _nakago = nihonto.nakago;
    _yasurime = nihonto.yasurime;
    _bohi = nihonto.bohi;
    _polish = nihonto.polish;
    _period = nihonto.period;
  }

  Nihonto _createNihonto() {
    return Nihonto(
        overallDescription: _overallDescription,
        type: _type,
        sugata: _sugata,
        signature: _signature,
        price: _price,
        measurements: _measurements,
        weight: _weight,
        sori: _sori,
        hada: _hada,
        kissaki: _kissaki,
        mune: _mune,
        hamon: _hamon,
        yakiba: _yakiba,
        boshi: _boshi,
        nakago: _nakago,
        yasurime: _yasurime,
        bohi: _bohi,
        polish: _polish,
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

  DropdownButtonFormField<T> _buildDropDownField<T extends EnumWithLabel<T>>({ @required String label,
    @required T value,
    @required List<DropdownMenuItem<T>> items,
    @required bool readOnly,
    @required ValueChanged<T> onChanged }) {

    // The only way to disable a drop down button is set to the property "onChanged"
    // to null but then the widget is empty. To fix this issue, we use the property
    // "disabledHint" which gets displayed when the widget is disabled.
    // 1) Widget enabled -> (onChanged != null) && (disabledHint == null)
    // 2) Widget disabled -> (onChanged == null) && (disabledHint != null)
    return DropdownButtonFormField<T>(
        decoration: FieldDecoration(label),
        value: value,
        items: items,
        disabledHint: (readOnly && (value != null)) ? Text(value.label) : null,
        onChanged: readOnly ? null: onChanged);
  }

  @override
  Widget build(BuildContext context) {
    final bool readOnly = (_mode == Mode.READ);

    final hadaWidget = MultiSelectFormField(
      key: Key('Hada-${_hada.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          HadaType.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _hada.types.values(),
      enabled: !readOnly,
      onSaved: (value) {
        setState(() {
          _hada = _hada.copyWith(types: EnumSet.from(value.cast<HadaType>()));
        });
      },
    );

    final hamonWidget = MultiSelectFormField(
      key: Key('Hamon-${_hamon.types}'),
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
      initialValue: _hamon.types.values(),
      enabled: !readOnly,
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          _hamon = _hamon.copyWith(types: EnumSet.from(value.cast<HamonType>()));
        });
      },
    );

    final yakibaWidget = MultiSelectFormField(
      key: Key('Yakiba-${_yakiba.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          Yakiba.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _yakiba.types.values(),
      enabled: !readOnly,
      onSaved: (value) {
        setState(() {
          _yakiba = _yakiba.copyWith(types: EnumSet.from(value.cast<Yakiba>()));
        });
      },
    );

    final boshiWidget = MultiSelectFormField(
      key: Key('Boshi-${_boshi.toString()}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          Boshi.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _boshi.types.values(),
      enabled: !readOnly,
      onSaved: (value) {
        setState(() {
          _boshi = _boshi.copyWith(types: EnumSet.from(value.cast<Boshi>()));
        });
      },
    );

    final nakagoWidget = MultiSelectFormField(
      key: Key('Nakago-${_nakago.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          Nakago.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _nakago.types.values(),
      enabled: !readOnly,
      onSaved: (value) {
        setState(() {
          _boshi = _boshi.copyWith(types: EnumSet.from(value.cast<Nakago>()));
        });
      },
    );

    final yasurimeWidget = MultiSelectFormField(
      key: Key('Yasurime-${_yasurime.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          Yasurime.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _yasurime.types.values(),
      enabled: !readOnly,
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          _yasurime = _yasurime.copyWith(types: EnumSet.from(value.cast<Yasurime>()));
        });
      },
    );

    final bohiWidget = MultiSelectFormField(
      key: Key('Bohi-${_bohi.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          Bohi.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _bohi.types.values(),
      enabled: !readOnly,
      onSaved: (value) {
        setState(() {
          _bohi = _bohi.copyWith(types: EnumSet.from(value.cast<Bohi>()));
        });
      },
    );

    final signatureWidget = MultiSelectFormField(
      key: Key('SignatureInfo-${_signature.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Features',
      dataSource:
      SignatureType.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _signature.types.values(),
      enabled: !readOnly,
      onSaved: (value) {
        setState(() {
          _signature = _signature.copyWith(types: EnumSet.from(value.cast<SignatureType>()));
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

              _buildDropDownField<NihontoType>(label: 'Type',
                  value: _type,
                  items: Utils.getDropDownMenuItems(NihontoType.values),
                  readOnly: readOnly,
                  onChanged: (value) {
                    setState(() {
                      _type = value;
                    });
                  })
            ]),

          // ============== //
          // === Sugata === //
          // ============== //

          ExpansibleTile(text: 'Sugata', initiallyExpanded: !_sugata.isBlank(),
            children: [
              _buildDropDownField<Sugata>(label: 'Type',
                  value: _sugata.type,
                  items: Utils.getDropDownMenuItems(Sugata.values),
                  readOnly: readOnly,
                  onChanged: (value) {
                    setState(() {
                      _sugata = _sugata.copyWith(type: value);
                    });
                  }),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _sugata.other ?? '',
              minLines: 1,
              maxLines: 25,
              key: Key('Sugata-Other-${_sugata.other}'),
              onChanged: (value) {
                setState(() {
                  _sugata = _sugata.copyWith(other: value);
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

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _signature.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Signature-Other-${_signature.other}'),
              onChanged: (value) {
                setState(() {
                  _signature = _signature.copyWith(other: value);
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

          ExpansibleTile(text: 'Sori', initiallyExpanded: !_sori.isBlank(), children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                      decoration: FieldDecoration('Sori'),
                      readOnly: true,
                      initialValue: "${_sori?.sori?.toText() ?? ''}",
                      textAlign: TextAlign.end,
                      key: Key('Sori-${_sori?.sori?.toText()}'),
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
                    child: _buildDropDownField<SoriType>(label: 'Type',
                        value: _sori.type,
                        items: Utils.getDropDownMenuItems(SoriType.values),
                        readOnly: readOnly,
                        onChanged: (value) {
                          setState(() {
                            _sori = _sori.copyWith(type: value);
                          });
                        })),
              ],
            ),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _sori.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Sori-Other-${_sori.other}'),
              onChanged: (value) {
                setState(() {
                  _sori = _sori.copyWith(other: value);
                });
              },
            ),
          ]),

          // =============== //
          // === Kissaki === //
          // =============== //

          ExpansibleTile(text: 'Kissaki', initiallyExpanded: !_kissaki.isBlank(), children: [
            _buildDropDownField<KissakiType>(label: 'Type',
                value: _kissaki.type,
                items: Utils.getDropDownMenuItems(KissakiType.values),
                readOnly: readOnly,
                onChanged: (value) {
                  setState(() {
                    _kissaki = _kissaki.copyWith(type: value);
                  });
                }),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _kissaki.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Kissaki-Other-${_kissaki.other}'),
              onChanged: (value) {
                setState(() {
                  _kissaki = _kissaki.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============ //
          // === Mune === //
          // ============ //

          ExpansibleTile(text: 'Mune', initiallyExpanded: !_mune.isBlank(), children: [
            _buildDropDownField<MuneType>(label: 'Type',
                value: _mune.type,
                items: Utils.getDropDownMenuItems(MuneType.values),
                readOnly: readOnly,
                onChanged: (value) {
                  setState(() {
                    _mune = _mune.copyWith(type: value);
                  });
                }),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _mune.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Mune-Other-${_mune.other}'),
              onChanged: (value) {
                setState(() {
                  _mune = _mune.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============ //
          // === Hada === //
          // ============ //

          ExpansibleTile(text: 'Hada', initiallyExpanded: !_hada.isBlank(), children: [
            hadaWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _hada.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Hada-Other-${_hada.other}'),
              onChanged: (value) {
                setState(() {
                  _hada = _hada.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============= //
          // === Hamon === //
          // ============= //

          ExpansibleTile(text: 'Hamon', initiallyExpanded: !_hamon.isBlank(), children: [
            hamonWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _hamon.other ?? '',
              minLines: 1,
              maxLines: 25,
              key: Key('Hamon-Other-${_hamon.other}'),
              onChanged: (value) {
                setState(() {
                  _hamon = _hamon.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============== //
          // === Yakiba === //
          // ============== //

          ExpansibleTile(text: 'Yakiba', initiallyExpanded: !_yakiba.isBlank(), children: [
            yakibaWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _yakiba.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Yakiba-Other-${_yakiba.other}'),
              onChanged: (value) {
                setState(() {
                  _yakiba = _yakiba.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============ //
          // === Bohi === //
          // ============ //

          ExpansibleTile(text: 'Boshi', initiallyExpanded: !_boshi.isBlank(), children: [
            boshiWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _boshi.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Boshi-Other-${_boshi.other}'),
              onChanged: (value) {
                setState(() {
                  _boshi = _boshi.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============== //
          // === Nakago === //
          // ============== //

          ExpansibleTile(text: 'Nakago', initiallyExpanded: !_nakago.isBlank(), children: [
            nakagoWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _nakago.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Nakago-Other-${_nakago.other}'),
              onChanged: (value) {
                setState(() {
                  _nakago = _nakago.copyWith(other: value);
                });
              },
            ),
          ]),

          // ================ //
          // === Yasurime === //
          // ================ //

          ExpansibleTile(text: 'Yasurime', initiallyExpanded: !_yasurime.isBlank(), children: [
            yasurimeWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _yasurime.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Yasurime-Other-${_yasurime.other}'),
              onChanged: (value) {
                setState(() {
                  _yasurime = _yasurime.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============ //
          // === Bohi === //
          // ============ //

          ExpansibleTile(text: 'Bohi', initiallyExpanded: !_bohi.isBlank(), children: [
            bohiWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _bohi.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Bohi-Other-${_bohi.other}'),
              onChanged: (value) {
                setState(() {
                  _bohi = _bohi.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============== //
          // === Polish === //
          // ============== //

          ExpansibleTile(text: 'Polish', initiallyExpanded: !_polish.isBlank(), children: [
            _buildDropDownField<PolishType>(label: 'Type',
                value: _polish.type,
                items: Utils.getDropDownMenuItems(PolishType.values),
                readOnly: readOnly,
                onChanged: (value) {
                  setState(() {
                    _polish = _polish.copyWith(type: value);
                  });
                }),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _polish.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Polish-Other-${_polish.other}'),
              onChanged: (value) {
                setState(() {
                  _polish = _polish.copyWith(other: value);
                });
              },
            ),
          ]),

          // ============== //
          // === Period === //
          // ============== //

          ExpansibleTile(text: 'Period', initiallyExpanded: readOnly, children: [
            _buildDropDownField<Period>(label: 'Period',
                value: _period,
                items: Utils.getDropDownMenuItems(Period.values),
                readOnly: readOnly,
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
