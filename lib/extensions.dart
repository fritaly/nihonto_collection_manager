import 'package:flutter/material.dart';
import 'package:nihonto_collection_manager/model/boshi.dart';
import 'package:nihonto_collection_manager/model/currency.dart';
import 'package:nihonto_collection_manager/model/geometry.dart';
import 'package:nihonto_collection_manager/model/hada.dart';
import 'package:nihonto_collection_manager/model/hamon_type.dart';
import 'package:nihonto_collection_manager/model/kissaki_type.dart';
import 'package:nihonto_collection_manager/model/length_unit.dart';
import 'package:nihonto_collection_manager/model/mune_type.dart';
import 'package:nihonto_collection_manager/model/nihonto_type.dart';
import 'package:nihonto_collection_manager/model/sori_type.dart';
import 'package:nihonto_collection_manager/model/yakiba.dart';

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

extension KissakiTypeExtension on KissakiType {

  String name() {
    return this.toString().split('.').last;
  }

  String label() {
    return name().capitalize().replaceAll(new RegExp("_"), " ");
  }
}

extension MuneTypeExtension on MuneType {

  String name() {
    return this.toString().split('.').last;
  }

  String label() {
    return name().capitalize().replaceAll(new RegExp("_"), " ");
  }
}

extension HamonTypeExtension on HamonType {

  String name() {
    return this.toString().split('.').last;
  }

  String label() {
    return name().capitalize().replaceAll(new RegExp("_"), " ");
  }
}

extension YakibaExtension on Yakiba {

  String name() {
    return this.toString().split('.').last;
  }

  String label() {
    return name().capitalize().replaceAll(new RegExp("_"), " ");
  }
}

extension BoshiExtension on Boshi {

  String name() {
    return this.toString().split('.').last;
  }

  String label() {
    return name().capitalize().replaceAll(new RegExp("_"), " ");
  }
}