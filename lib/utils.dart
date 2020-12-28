import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/extensions.dart';
import 'package:nihonto_collection_manager/model/currency.dart';
import 'package:nihonto_collection_manager/model/geometry.dart';
import 'package:nihonto_collection_manager/model/length_unit.dart';
import 'package:nihonto_collection_manager/model/nihonto_type.dart';

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

  static List<DropdownMenuItem> getLengthUnitMenuItems() {
    return LengthUnit.values.map((e) => DropdownMenuItem(
        child: Text(e.name()),
        value: e
    )).toList(growable: false);
  }

  static T random<T>(List<T> list) {
    assert (list != null);

    return list[Random().nextInt(list.length)];
  }

  static Currency randomCurrency() {
    return Utils.random(Currency.values);
  }

  static Geometry randomGeometry() {
    return Utils.random(Geometry.values);
  }

  static NihontoType randomNihontoType() {
    return Utils.random(NihontoType.values);
  }

  static String randomSignature() {
    return Utils.random([
      'Masamune',
      'Tadayoshi',
      'Gassan Sadakazu',
      'Ishido Teruhide',
      'Chounsai Emura',
      'Kanenori',
      'Murayama Kaneshige',
      'Koa Issin Mantetsu',
      'Masakiyo',
      'Masayuki',
      'Akihide',
      'Amahide',
      'Watanabe Kanenaga',
    ]);
  }

  static bool isDoubleValue(String s) {
    try {
      double.parse(s);

      return true;
    } on FormatException {
      return false;
    }
  }
}