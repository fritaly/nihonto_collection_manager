import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nihonto_collection_manager/extensions.dart';
import 'package:nihonto_collection_manager/model/length.dart';
import 'package:nihonto_collection_manager/model/length_unit.dart';
import 'package:nihonto_collection_manager/utils.dart';

class LengthWidget extends StatefulWidget {
  static final TextInputFormatter decimalNumber =
      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'));

  // Can be null
  Length _length;

  LengthWidget({Key key, Length length}) : super(key: key) {
    _length = length;
  }

  @override
  LengthWidgetState createState() => LengthWidgetState(_length);
}

class LengthWidgetState extends State<LengthWidget> {
  double _value;
  LengthUnit _unit;

  LengthWidgetState([ Length length ]) {
    if (length != null) {
      this._value = length.value;
      this._unit = length.unit;
    } else {
      // Default to 0 cm
      this._value = 0;
      this._unit = LengthUnit.CM;
    }
  }

  Length getLength() {
    return Length(_value, _unit);
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      TextFormField(
        decoration: InputDecoration(labelText: 'Value'),
        initialValue: "${_value}",
        key: Key(_value
            .toString()), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: <TextInputFormatter>[
          LengthWidget.decimalNumber
        ],
        onChanged: (value) {
          setState(() {
            _value = double.parse(value);
          });
        },
      ),
      DropdownButtonFormField(
          decoration: InputDecoration(labelText: 'Unit'),
          value: _unit,
          key: Key(_unit
              .name), // <-- https://stackoverflow.com/questions/58053956/setstate-does-not-update-textformfield-when-use-initialvalue
          items: Utils.getDropDownMenuItems(LengthUnit.values),
          onChanged: (value) {
            setState(() {
              _unit = value;
            });
          }),
    ]).pad();
  }
}
