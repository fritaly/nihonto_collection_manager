import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/model/currency.dart';

class Utils {

  static List<DropdownMenuItem<T>> getDropDownMenuItems<T extends EnumClass>(BuiltSet<T> values) {
    assert (values != null);

    return values.map((e) => DropdownMenuItem(
        child: Text(e.name),
        value: e
    )).toList(growable: false);
  }

  static List<DropdownMenuItem> getCurrencyMenuItems() {
    return Currency.values.map((e) => DropdownMenuItem(
        child: Text(e.name),
        value: e
    )).toList(growable: false);
  }

  static T random<T>(List<T> list) {
    assert (list != null);

    return list[Random().nextInt(list.length)];
  }

  static List<T> randomSublist<T>(List<T> list) {
    assert (list != null);

    final random = Random();

    return list.where((element) => random.nextBool()).toList();
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

  static Uri randomImageUri(int width) {
    assert (width > 0);

    return Uri.parse('https://picsum.photos/${width}?image=${Random().nextInt(100)}');
  }
}