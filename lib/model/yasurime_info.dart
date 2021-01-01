import 'dart:math';

import 'package:nihonto_collection_manager/Aggregate.dart';
import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/yasurime.dart';

class YasurimeInfo extends EnumSet<Yasurime> with Aggregate {

  YasurimeInfo([ Iterable<Yasurime> args ]): super(args);

  static YasurimeInfo random() {
    final random = Random();

    return YasurimeInfo(Yasurime.values.where((element) => random.nextBool()).toList());
  }

  @override
  bool isBlank() {
    return isEmpty();
  }
}