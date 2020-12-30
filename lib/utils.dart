import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/model/currency.dart';
import 'package:nihonto_collection_manager/model/polish.dart';
import 'package:nihonto_collection_manager/model/sugata.dart';
import 'package:nihonto_collection_manager/model/kissaki_type.dart';
import 'package:nihonto_collection_manager/model/length_unit.dart';
import 'package:nihonto_collection_manager/model/mune_type.dart';
import 'package:nihonto_collection_manager/model/nihonto_type.dart';
import 'package:nihonto_collection_manager/model/sori_type.dart';

class Utils {

  static List<DropdownMenuItem> getNihontoTypeMenuItems() {
    return NihontoType.values.map((e) => DropdownMenuItem(
        child: Text(e.label),
        value: e
    )).toList(growable: false);
  }

  static List<DropdownMenuItem> getSugataMenuItems() {
    return Sugata.values.map((e) => DropdownMenuItem(
        child: Text(e.label),
        value: e
    )).toList(growable: false);
  }

  static List<DropdownMenuItem> getCurrencyMenuItems() {
    return Currency.values.map((e) => DropdownMenuItem(
        child: Text(e.name),
        value: e
    )).toList(growable: false);
  }

  static List<DropdownMenuItem> getLengthUnitMenuItems() {
    return LengthUnit.values.map((e) => DropdownMenuItem(
        child: Text(e.name),
        value: e
    )).toList(growable: false);
  }

  static List<DropdownMenuItem> getKissakiTypeMenuItems() {
    return KissakiType.values.map((e) => DropdownMenuItem(
        child: Text(e.label),
        value: e
    )).toList(growable: false);
  }

  static List<DropdownMenuItem> getMuneTypeMenuItems() {
    return MuneType.values.map((e) => DropdownMenuItem(
        child: Text(e.label),
        value: e
    )).toList(growable: false);
  }

  static List<DropdownMenuItem> getSoriTypeMenuItems() {
    return SoriType.values.map((e) => DropdownMenuItem(
        child: Text(e.label),
        value: e
    )).toList(growable: false);
  }

  static List<DropdownMenuItem> getPolishMenuItems() {
    return Polish.values.map((e) => DropdownMenuItem(
        child: Text(e.label),
        value: e
    )).toList(growable: false);
  }

  static T random<T>(List<T> list) {
    assert (list != null);

    return list[Random().nextInt(list.length)];
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