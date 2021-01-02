import 'package:flutter/foundation.dart';

@immutable
abstract class Enum<T> {

  final String _name;

  String get name => _name;

  const Enum(this._name);

  @override
  String toString() {
    return '${runtimeType}.${name}';
  }
}

abstract class EnumWithLabel<T> extends Enum<T> {

  final String _label;

  String get label => _label;

  const EnumWithLabel(String name, this._label): super(name);
}
