import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/Utils.dart';
import 'package:nihonto_collection_manager/model/Currency.dart';
import 'package:nihonto_collection_manager/model/Geometry.dart';
import 'package:nihonto_collection_manager/model/NihontoType.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

extension WidgetExtension on Widget {

  Widget pad() {
    return new Container(padding: EdgeInsets.all(8.0), child: this);
  }
}

extension CurrencyExtension on Currency {

  String name() {
    return this.toString().split('.').last;
  }

  static Currency random() {
    return Utils.random(Currency.values);
  }
}

extension GeometryExtension on Geometry {

  String name() {
    return this.toString().split('.').last;
  }

  String label() {
    return name().capitalize().replaceAll(new RegExp("_"), " ");
  }

  static Geometry random() {
    return Utils.random(Geometry.values);
  }
}

extension NihontoTypeExtension on NihontoType {

  String name() {
    return this.toString().split('.').last;
  }

  String label() {
    return name().capitalize();
  }

  static NihontoType random() {
    return Utils.random(NihontoType.values);
  }
}