import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nihonto_collection_manager/extensions.dart';
import 'package:nihonto_collection_manager/model/weight.dart';
import 'package:nihonto_collection_manager/model/weight_unit.dart';
import 'package:nihonto_collection_manager/utils.dart';

class WeightWidget extends StatefulWidget {

  static final TextInputFormatter decimalNumber =
      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'));

  // Can be null
  Weight _weight;

  WeightWidget({Key key, Weight weight}) : super(key: key) {
    _weight = weight;
  }

  @override
  WeightWidgetState createState() => WeightWidgetState(_weight);
}

class WeightWidgetState extends State<WeightWidget> {
  double _value;
  WeightUnit _unit;

  WeightWidgetState([ Weight weight ]) {
    if (weight != null) {
      this._value = weight.value;
      this._unit = weight.unit;
    } else {
      // Default to 0 g
      this._value = 0;
      this._unit = WeightUnit.GRAM;
    }
  }

  Weight getWeight() {
    return Weight.of(_value, _unit);
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      TextFormField(
        decoration: InputDecoration(labelText: 'Value', border: OutlineInputBorder()),
        initialValue: "${_value}",
        key: Key(_value.toString()),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: <TextInputFormatter>[
          WeightWidget.decimalNumber
        ],
        onChanged: (value) {
          setState(() {
            _value = double.parse(value);
          });
        },
      ),
      SizedBox(height: 8),
      DropdownButtonFormField(
          decoration: InputDecoration(labelText: 'Unit', border: OutlineInputBorder()),
          value: _unit,
          key: Key(_unit.name),
          items: Utils.getDropDownMenuItems(WeightUnit.values),
          onChanged: (value) {
            setState(() {
              _unit = value;
            });
          }),
    ]).pad();
  }
}
