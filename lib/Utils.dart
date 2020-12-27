import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/Geometry.dart';
import 'package:nihonto_collection_manager/NihontoType.dart';

class Utils {

  static List<DropdownMenuItem> getNihontoTypeMenuItems() {
    return NihontoType.values.map((e) => DropdownMenuItem(
        child: Text(e.label()),
        value: e
    )).toList(growable: false);
  }

  static List<DropdownMenuItem> getGeometryMenuItems() {
    return Geometry.values.map((e) => DropdownMenuItem(
        child: Text(e.label()),
        value: e
    )).toList(growable: false);
  }

  static Widget pad(Widget widget) {
    assert (widget != null);

    return new Container(padding: EdgeInsets.all(8.0), child: widget);
  }
}