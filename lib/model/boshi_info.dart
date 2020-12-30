import 'dart:math';

import 'package:nihonto_collection_manager/enum_set.dart';
import 'package:nihonto_collection_manager/model/boshi.dart';

class BoshiInfo extends EnumSet<Boshi> {

  BoshiInfo([ Iterable<Boshi> args ]): super(args);

  static BoshiInfo random() {
    final random = Random();

    return BoshiInfo(Boshi.values.where((element) => random.nextBool()).toList());
  }
}
