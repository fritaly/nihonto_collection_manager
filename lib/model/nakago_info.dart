import 'dart:math';

import 'package:nihonto_collection_manager/model/nakago.dart';

class NakagoInfo {

  final _set = Set<Nakago>();

  NakagoInfo([ Iterable<Nakago> args ]) {
    if (args != null) {
      _set.addAll(args);
    }
  }

  NakagoInfo add(Nakago nakago) {
    assert (nakago != null);

    var set = Set<Nakago>.from(_set);
    set.add(nakago);

    return NakagoInfo(set);
  }

  NakagoInfo remove(Nakago nakago) {
    assert (nakago != null);

    var set = Set<Nakago>.from(_set);
    set.remove(nakago);

    return NakagoInfo(set);
  }

  static NakagoInfo random() {
    final random = Random();

    return NakagoInfo(Nakago.values.where((element) => random.nextBool()).toList());
  }

  bool getValue(Nakago nakago) {
    assert (nakago != null);

    return _set.contains(nakago);
  }

  @override
  String toString() {
    return 'NakagoInfo[set: ${_set}]';
  }
}
