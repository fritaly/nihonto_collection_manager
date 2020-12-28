import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/model/Currency.dart';
import 'package:nihonto_collection_manager/model/Geometry.dart';
import 'package:nihonto_collection_manager/model/NihontoType.dart';

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

  static List<DropdownMenuItem> getCurrencyMenuItems() {
    return Currency.values.map((e) => DropdownMenuItem(
        child: Text(e.name()),
        value: e
    )).toList(growable: false);
  }
}