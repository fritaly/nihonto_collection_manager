import 'dart:math';

import 'package:nihonto_collection_manager/model/hamon_type.dart';

class HamonInfo {

  final _set = Set<HamonType>();

  HamonInfo([ Iterable<HamonType> args ]) {
    if (args != null) {
      _set.addAll(args);
    }
  }

  HamonInfo add(HamonType type) {
    assert (type != null);

    var set = Set<HamonType>.from(_set);
    set.add(type);

    return HamonInfo(set);
  }

  HamonInfo remove(HamonType type) {
    assert (type != null);

    var set = Set<HamonType>.from(_set);
    set.remove(type);

    return HamonInfo(set);
  }

  static HamonInfo random() {
    final random = Random();

    return HamonInfo(HamonType.values.where((element) => random.nextBool()).toList());
  }

  bool getValue(HamonType type) {
    assert (type != null);

    return _set.contains(type);
  }

  @override
  String toString() {
    return 'HamonInfo[set: ${_set}]';
  }
}
