import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/model/currency.dart';
import 'package:nihonto_collection_manager/model/geometry.dart';
import 'package:nihonto_collection_manager/model/hada.dart';
import 'package:nihonto_collection_manager/model/length_unit.dart';
import 'package:nihonto_collection_manager/model/nihonto_type.dart';
import 'package:nihonto_collection_manager/model/sori_type.dart';

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
}

extension GeometryExtension on Geometry {

  String name() {
    return this.toString().split('.').last;
  }

  String label() {
    return name().capitalize().replaceAll(new RegExp("_"), " ");
  }
}

extension NihontoTypeExtension on NihontoType {

  String name() {
    return this.toString().split('.').last;
  }

  String label() {
    return name().capitalize();
  }
}

extension LengthUnitExtension on LengthUnit {

  String name() {
    return this.toString().split('.').last;
  }
}

extension SoriExtension on SoriType {

  String name() {
    return this.toString().split('.').last;
  }

  String label() {
    return name().capitalize().replaceAll(new RegExp("_"), " ");
  }
}

extension HadaExtension on Hada {

  String name() {
    return this.toString().split('.').last;
  }

  String label() {
    return name().capitalize().replaceAll(new RegExp("_"), " ");
  }
}