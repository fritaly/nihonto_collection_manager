import 'dart:math';

import 'package:nihonto_collection_manager/model/yasurime.dart';

class YasurimeInfo {

  final _set = Set<Yasurime>();

  YasurimeInfo([ Iterable<Yasurime> args ]) {
    if (args != null) {
      _set.addAll(args);
    }
  }

  YasurimeInfo add(Yasurime yasurime) {
    assert (yasurime != null);

    var set = Set<Yasurime>.from(_set);
    set.add(yasurime);

    return YasurimeInfo(set);
  }

  YasurimeInfo remove(Yasurime yasurime) {
    assert (yasurime != null);

    var set = Set<Yasurime>.from(_set);
    set.remove(yasurime);

    return YasurimeInfo(set);
  }

  static YasurimeInfo random() {
    final random = Random();

    return YasurimeInfo(Yasurime.values.where((element) => random.nextBool()).toList());
  }

  bool getValue(Yasurime yasurime) {
    assert (yasurime != null);

    return _set.contains(yasurime);
  }

  @override
  String toString() {
    return 'YasurimeInfo[set: ${_set}]';
  }
}
