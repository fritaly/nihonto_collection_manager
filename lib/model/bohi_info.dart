import 'dart:math';

import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/bohi.dart';

class BohiInfo extends EnumSet<Bohi> {

  BohiInfo([ Iterable<Bohi> args ]): super(args);

  static BohiInfo random() {
    final random = Random();

    return BohiInfo(Bohi.values.where((element) => random.nextBool()).toList());
  }
}
