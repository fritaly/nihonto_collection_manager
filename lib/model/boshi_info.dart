import 'dart:math';

import 'package:nihonto_collection_manager/model/boshi.dart';

class BoshiInfo {

  final _set = Set<Boshi>();

  BoshiInfo([ Iterable<Boshi> args ]) {
    if (args != null) {
      _set.addAll(args);
    }
  }

  BoshiInfo add(Boshi boshi) {
    assert (boshi != null);

    var set = Set<Boshi>.from(_set);
    set.add(boshi);

    return BoshiInfo(set);
  }

  BoshiInfo remove(Boshi boshi) {
    assert (boshi != null);

    var set = Set<Boshi>.from(_set);
    set.remove(boshi);

    return BoshiInfo(set);
  }

  static BoshiInfo random() {
    final random = Random();

    return BoshiInfo(Boshi.values.where((element) => random.nextBool()).toList());
  }

  bool getValue(Boshi boshi) {
    assert (boshi != null);

    return _set.contains(boshi);
  }

  List<Boshi> getValues() {
    return Boshi.values.where((element) => getValue(element)).toList();
  }

  @override
  String toString() {
    return 'BoshiInfo[set: ${_set}]';
  }
}
