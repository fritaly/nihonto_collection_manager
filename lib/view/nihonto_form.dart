import 'package:built_value/built_value.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/bohi.dart';
import 'package:nihonto_collection_manager/model/boshi.dart';
import 'package:nihonto_collection_manager/model/hada_type.dart';
import 'package:nihonto_collection_manager/model/hamon_type.dart';
import 'package:nihonto_collection_manager/model/kissaki_type.dart';
import 'package:nihonto_collection_manager/model/length.dart';
import 'package:nihonto_collection_manager/model/money.dart';
import 'package:nihonto_collection_manager/model/mune_type.dart';
import 'package:nihonto_collection_manager/model/nakago.dart';
import 'package:nihonto_collection_manager/model/nihonto.dart';
import 'package:nihonto_collection_manager/model/nihonto_type.dart';
import 'package:nihonto_collection_manager/model/period.dart';
import 'package:nihonto_collection_manager/model/polish_type.dart';
import 'package:nihonto_collection_manager/model/signature_type.dart';
import 'package:nihonto_collection_manager/model/sori_type.dart';
import 'package:nihonto_collection_manager/model/sugata.dart';
import 'package:nihonto_collection_manager/model/weight.dart';
import 'package:nihonto_collection_manager/model/yakiba.dart';
import 'package:nihonto_collection_manager/model/yasurime.dart';
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

  NihontoForm(Mode mode, Nihonto nihonto) {
    assert (mode != null);
    assert (nihonto != null);

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

  Nihonto _current = Nihonto(), _backup;

  NihontoFormState(Mode mode, Nihonto nihonto) {
    assert (mode != null);
    assert (nihonto != null);

    this._mode = mode;
    this._backup = nihonto;
    this._current = nihonto;
  }

  void _randomize() {
    setState(() {
      _current = Nihonto.random();
    });
  }

  bool _hasChanges() {
    return _current != _backup;
  }

  void _save() {
    if (!_hasChanges()) {
      print('No change to save');

      return;
    }

    // Validate returns true if the form is valid, otherwise false.
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

      // Pass the entry created to the navigator and display the previous screen
      Navigator.pop(context, _current);
    }
  }

  void _undo() {
    if (_hasChanges()) {
      final AlertDialog dialog = AlertDialog(
        title: Text('Discard changes ?'),
        content:
        const Text("You're about to undo some pending changes."),
        actions: [
          FlatButton(
            textColor: Color(0xFF6200EE),
            onPressed: () {
              // Hide the dialog and do nothing
              Navigator.pop(context);
            },
            child: const Text('CANCEL'),
          ),
          FlatButton(
            textColor: Color(0xFF6200EE),
            onPressed: () {
              // Hide the dialog and undo the changes
              Navigator.pop(context);

              setState(() {
                _current = _backup;
              });
            },
            child: const Text('ACCEPT'),
          ),
        ],
      );

      showDialog<void>(context: context, builder: (context) => dialog);
    }
  }

  void _back() {
    if (_hasChanges()) {
      final AlertDialog dialog = AlertDialog(
        title: Text('Discard changes ?'),
        content:
        const Text("You're about to lose some pending changes."),
        actions: [
          FlatButton(
            textColor: Color(0xFF6200EE),
            onPressed: () {
              // Hide the dialog
              Navigator.pop(context); },
            child: const Text('CANCEL'),
          ),
          FlatButton(
            textColor: Color(0xFF6200EE),
            onPressed: () {
              // Hide the dialog
              Navigator.pop(context);

              // Display the previous page
              Navigator.pop(context);
            },
            child: const Text('ACCEPT'),
          ),
        ],
      );

      showDialog<void>(context: context, builder: (context) => dialog);
    } else {
      // Display the previous page
      Navigator.pop(context);
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

  DropdownButtonFormField<T> _buildDropDownField<T extends EnumClass>({ @required String label,
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
        disabledHint: (readOnly && (value != null)) ? Text(Utils.labelOf(value)) : null,
        onChanged: readOnly ? null: onChanged);
  }

  @override
  Widget build(BuildContext context) {
    final bool readOnly = (_mode == Mode.READ);

    final hadaWidget = MultiSelectFormField(
      key: Key('Hada-${_current.hada.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          HadaType.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _current.hada.types.toList(),
      enabled: !readOnly,
      onSaved: (value) {
        setState(() {
          _current = _current.rebuild((builder) => builder.hada.types.replace(value));
        });
      },
    );

    final hamonWidget = MultiSelectFormField(
      key: Key('Hamon-${_current.hamon.types}'),
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
      initialValue: _current.hamon.types.toList(),
      enabled: !readOnly,
      onSaved: (value) {
        print('Value=${value}');

        setState(() {
          _current = _current.rebuild((builder) => builder.hamon.types.replace(value));
        });
      },
    );

    final yakibaWidget = MultiSelectFormField(
      key: Key('Yakiba-${_current.yakiba.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          Yakiba.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _current.yakiba.types.toList(),
      enabled: !readOnly,
      onSaved: (value) {
        setState(() {
          _current = _current.rebuild((builder) => builder.yakiba.types.replace(value));
        });
      },
    );

    final boshiWidget = MultiSelectFormField(
      key: Key('Boshi-${_current.boshi.toString()}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          Boshi.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _current.boshi.types.toList(),
      enabled: !readOnly,
      onSaved: (value) {
        setState(() {
          _current = _current.rebuild((builder) => builder.boshi.types.replace(value));
        });
      },
    );

    final nakagoWidget = MultiSelectFormField(
      key: Key('Nakago-${_current.nakago.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          Nakago.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _current.nakago.types.toList(),
      enabled: !readOnly,
      onSaved: (value) {
        setState(() {
          _current = _current.rebuild((builder) => builder.nakago.types.replace(value));
        });
      },
    );

    final yasurimeWidget = MultiSelectFormField(
      key: Key('Yasurime-${_current.yasurime.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          Yasurime.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _current.yasurime.types.toList(),
      enabled: !readOnly,
      onSaved: (value) {
        setState(() {
          _current = _current.rebuild((builder) => builder.yasurime.types = value);
        });
      },
    );

    final bohiWidget = MultiSelectFormField(
      key: Key('Bohi-${_current.bohi.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Type',
      dataSource:
          Bohi.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _current.bohi.types.toList(),
      enabled: !readOnly,
      onSaved: (value) {
        setState(() {
          _current = _current.rebuild((builder) => builder
            .bohi.types.replace(value.cast<Bohi>()));
        });
      },
    );

    final signatureWidget = MultiSelectFormField(
      key: Key('SignatureInfo-${_current.signature.types}'),
      autovalidate: false,
      border: OutlineInputBorder(),
      title: 'Features',
      dataSource:
      SignatureType.values.map((e) => {'display': e.label, 'value': e}).toList(),
      textField: 'display',
      valueField: 'value',
      // required: true,
      hintWidget: Text('Please choose one or more'),
      initialValue: _current.signature.types.values(),
      enabled: !readOnly,
      onSaved: (value) {
        setState(() {
          _current = _current.rebuild((builder) => builder
            ..signature = _current.signature.copyWith(types: EnumSet.from(value.cast<SignatureType>())));
        });
      },
    );

    const columnPadder = SizedBox(height: 8);

    const rowPadder = SizedBox(width: 8);

    // Build a Form widget using the _formKey created above.
    final form = Form(
        key: _formKey,
        child: Column(children: <Widget>[

          // Only display the image if defined. Display a black border around the image
          if (_current.imageUri != null)
            new Container(padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: CachedNetworkImage(
                imageUrl: _current.imageUri.toString()
            ), /* decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(4)) */), columnPadder,

          // =========================== //
          // === Overall description === //
          // =========================== //

          ExpansibleTile(text: 'General', initiallyExpanded: true,
            children: [
              TextFormField(
                decoration: FieldDecoration('Reference number'),
                readOnly: readOnly,
                initialValue: _current.referenceNumber ?? '',
                key: Key('Overall-ReferenceNumber-${_current.referenceNumber}'),
                validator: (value) {
                  final regexp = new RegExp(
                    r"^#?[A-Z0-9_-]{1,3}",
                    caseSensitive: false,
                    multiLine: false,
                  );

                  if (!regexp.hasMatch(value)) {
                    return "The reference number isn't valid";
                  }

                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _current = _current.rebuild((builder) => builder
                      ..referenceNumber = value);
                  });
                },
              ),

              columnPadder,

              TextFormField(
                decoration: FieldDecoration('Overall description'),
                readOnly: readOnly,
                initialValue: _current.overallDescription ?? '',
                minLines: 1,
                maxLines: 25,
                key: Key('Overall-Description-${_current.overallDescription}'),
                onChanged: (value) {
                  setState(() {
                    _current = _current.rebuild((builder) => builder
                      ..overallDescription = value);
                  });
                },
              ),

              columnPadder,

              // ============ //
              // === Type === //
              // ============ //

              _buildDropDownField<NihontoType>(label: 'Type',
                  value: _current.type,
                  items: Utils.getDropDownMenuItems(NihontoType.values),
                  readOnly: readOnly,
                  onChanged: (value) {
                    setState(() {
                      _current = _current.rebuild((builder) => builder
                        ..type = value);
                    });
                  })
            ]),

          // ============== //
          // === Sugata === //
          // ============== //

          ExpansibleTile(text: 'Sugata', initiallyExpanded: !_current.sugata.isBlank(),
            children: [
              _buildDropDownField<Sugata>(label: 'Type',
                  value: _current.sugata.type,
                  items: Utils.getDropDownMenuItems(Sugata.values),
                  readOnly: readOnly,
                  onChanged: (value) {
                    setState(() {
                      _current = _current.rebuild((builder) => builder.sugata.type = value);
                    });
                  }),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _current.sugata.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Sugata-Other-${_current.sugata.other}'),
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder.sugata.other = value);
                });
              },
            ),
          ],),

          // ================= //
          // === Signature === //
          // ================= //

          ExpansibleTile(text: 'Signature', initiallyExpanded: !_current.signature.isBlank(), children: [
            TextFormField(
              decoration: FieldDecoration('Romaji'),
              readOnly: readOnly,
              initialValue: _current.signature.romaji,
              key: Key('Signature-Romaji-${_current.signature.romaji}'),
              minLines: 1,
              maxLines: 25,
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder
                    ..signature = _current.signature.copyWith(romaji: value));
                });
              },
            ),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Kanji'),
              readOnly: readOnly,
              initialValue: _current.signature.kanji,
              key: Key('Signature-Kanji-${_current.signature.kanji}'),
              minLines: 1,
              maxLines: 25,
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder
                    ..signature = _current.signature.copyWith(kanji: value));
                });
              },
            ),

            columnPadder,

            signatureWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _current.signature.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Signature-Other-${_current.signature.other}'),
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder
                    ..signature = _current.signature.copyWith(other: value));
                });
              },
            ),
          ]),

          ExpansibleTile(text: 'Measurements', initiallyExpanded: !_current.measurements.isBlank(), children: [
            Row(
              children: [
                Expanded(
                    child:

                    TextFormField(
                      decoration: FieldDecoration('Nagasa'),
                      readOnly: true,
                      initialValue: "${_current.measurements.nagasa?.toText() ?? ''}",
                      textAlign: TextAlign.end,
                      key: Key(
                          'Nagasa-${_current.measurements.nagasa?.toText()}'),
                      onTap: () {
                        if (readOnly) {
                          return;
                        }

                        showDialog(
                            context: context,
                            builder: (context) {
                              return _showLengthDialog(
                                  context, 'Set the nagasa', _current.measurements.nagasa);
                            }).then((value) {
                          if (value != null) {
                            setState(() {
                              // Update the nagasa based on the value returned by the dialog
                              _current = _current.rebuild((builder) => builder
                                ..measurements = _current.measurements.copyWith(nagasa: value));
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
                      initialValue: "${_current.measurements.totalLength?.toText() ?? ''}",
                      textAlign: TextAlign.end,
                      key: Key('TotalLength-${_current.measurements.totalLength?.toText()}'),
                      onTap: () {
                        if (readOnly) {
                          return;
                        }

                        showDialog(
                            context: context,
                            builder: (context) {
                              return _showLengthDialog(
                                  context, 'Set the total length', _current.measurements.totalLength);
                            }).then((value) {
                          if (value != null) {
                            setState(() {
                              _current = _current.rebuild((builder) => builder
                                ..measurements = _current.measurements.copyWith(totalLength: value));

                              print("Total length set to ${value}");
                            });
                          } else {
                            // The value is null if the user clicked "Cancel"
                          }
                        });
                      },
                    )),
                rowPadder,
                Expanded(child: TextFormField(
                  decoration: FieldDecoration('Weight'),
                  readOnly: true,
                  initialValue: "${_current.measurements.weight?.toText() ?? ''}",
                  textAlign: TextAlign.end,
                  key: Key('Weight-${_current.measurements.weight?.toText()}'),
                  onTap: () {
                    if (readOnly) {
                      return;
                    }

                    showDialog(
                        context: context,
                        builder: (context) {
                          return _showWeightDialog(
                              context, 'Set the weight', _current.measurements.weight);
                        }).then((value) {
                      if (value != null) {
                        setState(() {
                          _current = _current.rebuild((builder) => builder
                            ..measurements = _current.measurements.copyWith(weight: value));
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
                    initialValue: "${_current.measurements.kasane?.toText() ?? ''}",
                    textAlign: TextAlign.end,
                    key: Key('Kasane-${_current.measurements.kasane?.toText()}'),
                    onTap: () {
                      if (readOnly) {
                        return;
                      }

                      showDialog(
                          context: context,
                          builder: (context) {
                            return _showLengthDialog(
                                context, 'Set the kasane', _current.measurements.kasane);
                          }).then((value) {
                        if (value != null) {
                          setState(() {
                            _current = _current.rebuild((builder) => builder
                              ..measurements = _current.measurements.copyWith(kasane: value));

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
                    initialValue: "${_current.measurements.motokasane?.toText() ?? ''}",
                    textAlign: TextAlign.end,
                    key: Key('Motokasane-${_current.measurements.motokasane?.toText()}'),
                    onTap: () {
                      if (readOnly) {
                        return;
                      }

                      showDialog(
                          context: context,
                          builder: (context) {
                            return _showLengthDialog(
                                context, 'Set the motokasane', _current.measurements.motokasane);
                          }).then((value) {
                        if (value != null) {
                          setState(() {
                            _current = _current.rebuild((builder) => builder
                              ..measurements = _current.measurements.copyWith(motokasane: value));

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
                    initialValue: "${_current.measurements.sakikasane?.toText() ?? ''}",
                    textAlign: TextAlign.end,
                    key: Key('Sakikasane-${_current.measurements.sakikasane?.toText()}'),
                    onTap: () {
                      if (readOnly) {
                        return;
                      }

                      showDialog(
                          context: context,
                          builder: (context) {
                            return _showLengthDialog(
                                context, 'Set the sakikasane', _current.measurements.sakikasane);
                          }).then((value) {
                        if (value != null) {
                          setState(() {
                            _current = _current.rebuild((builder) => builder
                              ..measurements = _current.measurements.copyWith(sakikasane: value));

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
                  initialValue: "${_current.measurements.mihaba?.toText() ?? ''}",
                  textAlign: TextAlign.end,
                  key: Key('Mihaba-${_current.measurements.mihaba?.toText()}'),
                  onTap: () {
                    if (readOnly) {
                      return;
                    }

                    showDialog(
                        context: context,
                        builder: (context) {
                          return _showLengthDialog(
                              context, 'Set the mihaba', _current.measurements.mihaba);
                        }).then((value) {
                      if (value != null) {
                        setState(() {
                          _current = _current.rebuild((builder) => builder
                            ..measurements = _current.measurements.copyWith(mihaba: value));

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
                  initialValue: "${_current.measurements.motohaba?.toText() ?? ''}",
                  textAlign: TextAlign.end,
                  key: Key('Motohaba-${_current.measurements.motohaba?.toText()}'),
                  onTap: () {
                    if (readOnly) {
                      return;
                    }

                    showDialog(
                        context: context,
                        builder: (context) {
                          return _showLengthDialog(
                              context, 'Set the motohaba', _current.measurements.motohaba);
                        }).then((value) {
                      if (value != null) {
                        setState(() {
                          _current = _current.rebuild((builder) => builder
                            ..measurements = _current.measurements.copyWith(motohaba: value));

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
                    initialValue: "${_current.measurements.sakihaba?.toText() ?? ''}",
                    textAlign: TextAlign.end,
                    key: Key('Sakihaba-${_current.measurements.sakihaba?.toText()}'),
                    onTap: () {
                      if (readOnly) {
                        return;
                      }

                      showDialog(
                          context: context,
                          builder: (context) {
                            return _showLengthDialog(
                                context, 'Set the sakihaba', _current.measurements.sakihaba);
                          }).then((value) {
                        if (value != null) {
                          setState(() {
                            _current = _current.rebuild((builder) => builder
                              ..measurements = _current.measurements.copyWith(sakihaba: value));

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

          ExpansibleTile(text: 'Sori', initiallyExpanded: !_current.sori.isBlank(), children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                      decoration: FieldDecoration('Sori'),
                      readOnly: true,
                      initialValue: "${_current.sori.sori?.toText() ?? ''}",
                      textAlign: TextAlign.end,
                      key: Key('Sori-${_current.sori.sori?.toText()}'),
                      onTap: () {
                        if (readOnly) {
                          return;
                        }

                        showDialog(
                            context: context,
                            builder: (context) {
                              return _showLengthDialog(
                                  context, 'Set the sori', _current.sori.sori);
                            }).then((value) {
                          if (value != null) {
                            setState(() {
                              // Update the sori based on the value returned by the dialog
                              _current = _current.rebuild((builder) => builder
                                ..sori = _current.sori.copyWith(sori: value));

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
                        value: _current.sori.type,
                        items: Utils.getDropDownMenuItems(SoriType.values),
                        readOnly: readOnly,
                        onChanged: (value) {
                          setState(() {
                            _current = _current.rebuild((builder) => builder
                              ..sori = _current.sori.copyWith(type: value));
                          });
                        })),
              ],
            ),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _current.sori.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Sori-Other-${_current.sori.other}'),
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder
                    ..sori = _current.sori.copyWith(other: value));
                });
              },
            ),
          ]),

          // =============== //
          // === Kissaki === //
          // =============== //

          ExpansibleTile(text: 'Kissaki', initiallyExpanded: !_current.kissaki.isBlank(), children: [
            _buildDropDownField<KissakiType>(label: 'Type',
                value: _current.kissaki.type,
                items: Utils.getDropDownMenuItems(KissakiType.values),
                readOnly: readOnly,
                onChanged: (value) {
                  setState(() {
                    _current = _current.rebuild((builder) => builder.kissaki.type = value);
                  });
                }),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _current.kissaki.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Kissaki-Other-${_current.kissaki.other}'),
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder.kissaki.other = value);
                });
              },
            ),
          ]),

          // ============ //
          // === Mune === //
          // ============ //

          ExpansibleTile(text: 'Mune', initiallyExpanded: !_current.mune.isBlank(), children: [
            _buildDropDownField<MuneType>(label: 'Type',
                value: _current.mune.type,
                items: Utils.getDropDownMenuItems(MuneType.values),
                readOnly: readOnly,
                onChanged: (value) {
                  setState(() {
                    _current = _current.rebuild((builder) => builder.mune.type = value);
                  });
                }),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _current.mune.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Mune-Other-${_current.mune.other}'),
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder.mune.other = value);
                });
              },
            ),
          ]),

          // ============ //
          // === Hada === //
          // ============ //

          ExpansibleTile(text: 'Hada', initiallyExpanded: !_current.hada.isBlank(), children: [
            hadaWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _current.hada.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Hada-Other-${_current.hada.other}'),
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder.hada.other = value);
                });
              },
            ),
          ]),

          // ============= //
          // === Hamon === //
          // ============= //

          ExpansibleTile(text: 'Hamon', initiallyExpanded: !_current.hamon.isBlank(), children: [
            hamonWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _current.hamon.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Hamon-Other-${_current.hamon.other}'),
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder.hamon.other = value);
                });
              },
            ),
          ]),

          // ============== //
          // === Yakiba === //
          // ============== //

          ExpansibleTile(text: 'Yakiba', initiallyExpanded: !_current.yakiba.isBlank(), children: [
            yakibaWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _current.yakiba.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Yakiba-Other-${_current.yakiba.other}'),
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder.yakiba.other = value);
                });
              },
            ),
          ]),

          // ============ //
          // === Bohi === //
          // ============ //

          ExpansibleTile(text: 'Boshi', initiallyExpanded: !_current.boshi.isBlank(), children: [
            boshiWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _current.boshi.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Boshi-Other-${_current.boshi.other}'),
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder.boshi.other = value);
                });
              },
            ),
          ]),

          // ============== //
          // === Nakago === //
          // ============== //

          ExpansibleTile(text: 'Nakago', initiallyExpanded: !_current.nakago.isBlank(), children: [
            nakagoWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _current.nakago.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Nakago-Other-${_current.nakago.other}'),
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder.nakago.other = value);
                });
              },
            ),
          ]),

          // ================ //
          // === Yasurime === //
          // ================ //

          ExpansibleTile(text: 'Yasurime', initiallyExpanded: !_current.yasurime.isBlank(), children: [
            yasurimeWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _current.yasurime.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Yasurime-Other-${_current.yasurime.other}'),
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder.yasurime.other = value);
                });
              },
            ),
          ]),

          // ============ //
          // === Bohi === //
          // ============ //

          ExpansibleTile(text: 'Bohi', initiallyExpanded: !_current.bohi.isBlank(), children: [
            bohiWidget,

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _current.bohi.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Bohi-Other-${_current.bohi.other}'),
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder.bohi.other = value);
                });
              },
            ),
          ]),

          // ============== //
          // === Polish === //
          // ============== //

          ExpansibleTile(text: 'Polish', initiallyExpanded: !_current.polish.isBlank(), children: [
            _buildDropDownField<PolishType>(label: 'Type',
                value: _current.polish.type,
                items: Utils.getDropDownMenuItems(PolishType.values),
                readOnly: readOnly,
                onChanged: (value) {
                  setState(() {
                    _current = _current.rebuild((builder) => builder
                      ..polish = _current.polish.copyWith(type: value));
                  });
                }),

            columnPadder,

            TextFormField(
              decoration: FieldDecoration('Other'),
              readOnly: readOnly,
              initialValue: _current.polish.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Polish-Other-${_current.polish.other}'),
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder
                    ..polish = _current.polish.copyWith(other: value));
                });
              },
            ),
          ]),

          // ============== //
          // === Period === //
          // ============== //

          ExpansibleTile(text: 'Period', initiallyExpanded: (_current.period != null), children: [
            _buildDropDownField<Period>(label: 'Period',
                value: _current.period,
                items: Utils.getDropDownMenuItems(Period.values),
                readOnly: readOnly,
                onChanged: (value) {
                  setState(() {
                    _current = _current.rebuild((builder) => builder
                      ..period = value);
                  });
                }),
          ]),

          // ============== //
          // === School === //
          // ============== //

          ExpansibleTile(text: 'School', initiallyExpanded: !_current.school.isBlank(), children: [
            TextFormField(
              decoration: FieldDecoration('School'),
              readOnly: readOnly,
              initialValue: _current.school.school,
              minLines: 1,
              maxLines: 25,
              key: Key('School-School-${_current.school.school}'),
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder
                    ..school = _current.school.copyWith(school: value));
                });
              },
            ),
          ]),

          // =================== //
          // === Attribution === //
          // =================== //

          ExpansibleTile(text: 'Attribution', initiallyExpanded: (_current.attribution != null) && !_current.attribution.isEmpty, children: [
            TextFormField(
              decoration: FieldDecoration('Attribution'),
              readOnly: readOnly,
              initialValue: _current.attribution,
              minLines: 1,
              maxLines: 25,
              key: Key('Attribution-${_current.attribution}'),
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder
                    ..attribution = value);
                });
              },
            ),
          ]),

          // ================== //
          // === Other Info === //
          // ================== //

          ExpansibleTile(text: 'Other', initiallyExpanded: (_current.other != null) && !_current.other.isEmpty, children: [
            TextFormField(
              decoration: FieldDecoration('Other information'),
              readOnly: readOnly,
              initialValue: _current.other,
              minLines: 1,
              maxLines: 25,
              key: Key('Other-Information-${_current.other}'),
              onChanged: (value) {
                setState(() {
                  _current = _current.rebuild((builder) => builder
                    ..other = value);
                });
              },
            ),
          ]),

          ExpansibleTile(text: 'Miscellaneous', initiallyExpanded: readOnly, children: [
            Row(children: [
              Expanded(child: TextFormField(
                decoration: FieldDecoration('Asking price'),
                readOnly: true,
                initialValue: "${_current.price?.toText() ?? ''}",
                textAlign: TextAlign.end,
                key: Key('Price-${_current.price?.toText()}'),
                onTap: () {
                  if (readOnly) {
                    return;
                  }

                  showDialog(
                      context: context,
                      builder: (context) {
                        return _showPriceDialog(context, _current.price);
                      }).then((value) {
                    if (value != null) {
                      setState(() {
                        // Update the price based on the value returned by the dialog
                        _current = _current.rebuild((builder) => builder
                          ..price = value);
                      });
                    } else {
                      // The value is null if the user clicked "Cancel"
                    }
                  });
                },
              ),),
            ],
            ),
          ]),

        ]));

    var footerButtons = <Widget>[];

    if (!readOnly) {
      // Only display the footerButtons if not in read-only mode
      footerButtons.add(RaisedButton(elevation: 8, color: Colors.green, child: Icon(Icons.report_problem_outlined, color: Colors.white), onPressed: _randomize));

      // Grey out the UNDO action if the form doesn't have changes
      footerButtons.add(RaisedButton(elevation: 8, color: Colors.green, child: Icon(Icons.undo_outlined, color: _hasChanges() ? Colors.white : const Color(0xFFD0D0D0), semanticLabel: 'Undo changes'), onPressed: _undo));

      // Grey out the SAVE action if the form doesn't have changes
      footerButtons.add(RaisedButton(elevation: 8, color: Colors.green, child: Icon(Icons.save, color: _hasChanges() ? Colors.white : const Color(0xFFD0D0D0), semanticLabel: 'Save changes'), onPressed: _save));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Nihonto information'),
        leading: TextButton(child: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: _back),
      ),
      body: ListView(children: [form]), // Wrap the form into a list view to support scrolling
      persistentFooterButtons: footerButtons.isEmpty ? null : footerButtons,
    );
  }
}
