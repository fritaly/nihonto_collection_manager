import 'dart:math';

import 'package:nihonto_collection_manager/model/yakiba.dart';

class YakibaInfo {

  final _set = Set<Yakiba>();

  YakibaInfo([ Iterable<Yakiba> args ]) {
    if (args != null) {
      _set.addAll(args);
    }
  }

  YakibaInfo add(Yakiba yakiba) {
    assert (yakiba != null);

    var set = Set<Yakiba>.from(_set);
    set.add(yakiba);

    return YakibaInfo(set);
  }

  YakibaInfo remove(Yakiba yakiba) {
    assert (yakiba != null);

    var set = Set<Yakiba>.from(_set);
    set.remove(yakiba);

    return YakibaInfo(set);
  }

  static YakibaInfo random() {
    final random = Random();

    return YakibaInfo(Yakiba.values.where((element) => random.nextBool()).toList());
  }

  bool getValue(Yakiba yakiba) {
    assert (yakiba != null);

    return _set.contains(yakiba);
  }

  @override
  String toString() {
    return 'YakibaInfo[set: ${_set}]';
  }
}
