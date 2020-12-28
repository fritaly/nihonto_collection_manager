import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/model/length.dart';
import 'package:nihonto_collection_manager/model/length_unit.dart';

class UnitConverter extends StatefulWidget {
  UnitConverter() {
  }

  @override
  _UnitConverterState createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  _UnitConverterState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          Text("${Length(75, LengthUnit.cm).asJapaneseLength().toText()}")
        ]));
  }
}
