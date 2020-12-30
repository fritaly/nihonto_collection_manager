import 'dart:math';

import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/nakago.dart';

class NakagoInfo extends EnumSet<Nakago> {

  NakagoInfo([ Iterable<Nakago> args ]): super(args);

  static NakagoInfo random() {
    final random = Random();

    return NakagoInfo(Nakago.values.where((element) => random.nextBool()).toList());
  }
}