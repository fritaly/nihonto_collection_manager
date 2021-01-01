import 'dart:math';

import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/nakago.dart';

class NakagoInfo extends EnumSet<Nakago> with Aggregate {

  NakagoInfo([ Iterable<Nakago> args ]): super(args);

  static NakagoInfo random() {
    final random = Random();

    return NakagoInfo(Nakago.values.where((element) => random.nextBool()).toList());
  }

  @override
  bool isBlank() {
    return isEmpty();
  }
}